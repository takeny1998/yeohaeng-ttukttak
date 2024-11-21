import 'dart:math';

import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/domain/place/place_provider.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_plan_manage_provider.g.dart';

@riverpod
class TravelPlanManage extends _$TravelPlanManage {

  static const List<double> mapHeightRatios = [0.0, 0.4, 1.0];

  @override
  TravelPlanManageState? build(int travelId) {
    _init();
    return null;
  }

  void _init() async {
    final response = await ref
        .watch(httpServiceProvider)
        .request('GET', '/api/v2/travels/$travelId/visits');

    final travel = await ref.watch(travelProvider(travelId).future);
    final visits = TravelVisitModel.listFromJson(response);

    final visitPlaces = await _fetchPlaces(visits);

    state = TravelPlanManageState(
      travel: travel,
      selectedDate: travel.startedOn,
      visitPlaces: visitPlaces,
    );
  }

  void selectDate(DateTime date) {
    if (state?.selectedDate == date) return;
    state = state?.copyWith(selectedDate: date);
  }

  void endAnimating() {
    if (state == null || !state!.isAnimating) return;

    state = state!.copyWith(isAnimating: false);
  }

  void updateMapHeight(double dy) {

    if (state == null || state!.isAnimating) return;

    final isScrollingDown = dy > 0.0;
    final mapHeightLevel = state!.mapHeightLevel;

    if (isScrollingDown) {
      if (mapHeightLevel + 1 == mapHeightRatios.length) return;

      state = state!.copyWith(
        isAnimating: true,
        mapHeightLevel: mapHeightLevel + 1
      );
    } else {
      if (mapHeightLevel == 0) return;

      state = state!.copyWith(
          isAnimating: true,
          mapHeightLevel: mapHeightLevel - 1
      );
    }
  }

  Future<void> move(TravelVisitWithPlaceModel from, int order) async {
    if (state == null) return;

    final newVisits =
        await ref.read(asyncLoadingProvider.notifier).guard(() async {
      final auth = await ref.read(authServiceProvider).find();

      final selectedDate = state!.selectedDate;

      final response = await ref.read(httpServiceProvider).request(
        'PATCH',
        '/api/v2/travels/$travelId/visits/${from.visit.id}',
        authorization: auth.accessToken,
        data: {
          'visitedOn': selectedDate.toIso8601String(),
          'orderOfVisit': order,
        },
      );

      return TravelVisitModel.listFromJson(response);
    });

    final newVisitPlaces = await _fetchPlaces(newVisits);
    state = state!.copyWith(visitPlaces: newVisitPlaces);
  }

  Future<void> delete(TravelVisitWithPlaceModel visitPlace) async {

    if (state == null) return;

    await ref.read(asyncLoadingProvider.notifier).guard(() async {
      final auth = await ref.read(authServiceProvider).find();

      await ref.read(httpServiceProvider).request(
            'DELETE',
            '/api/v2/travels/$travelId/visits/${visitPlace.visit.id}',
            authorization: auth.accessToken,
          );
    });

    final newVisitPlaces = List.of(state!.visitPlaces)..remove(visitPlace);
    state = state!.copyWith(visitPlaces: newVisitPlaces);
  }

  Future<List<TravelVisitWithPlaceModel>> _fetchPlaces(
      List<TravelVisitModel> newVisits) async {
    return await Future.wait(newVisits.map((visit) async =>
        TravelVisitWithPlaceModel(
            visit: visit,
            place: await ref.watch(placeProvider(visit.placeId).future))));
  }



}
