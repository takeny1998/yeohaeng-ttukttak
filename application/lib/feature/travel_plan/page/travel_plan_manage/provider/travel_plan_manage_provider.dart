import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/domain/place/place_provider.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_plan_manage_provider.g.dart';

@riverpod
class TravelPlanManage extends _$TravelPlanManage {
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

    final visitPlaces = await Future.wait(visits.map((visit) async =>
        TravelVisitWithPlaceModel(
            visit: visit,
            place: await ref.watch(placeProvider(visit.placeId).future))));

    state = TravelPlanManageState(
      travel: travel,
      selectedDate: travel.startedOn,
      visitPlaces: visitPlaces,
    );
  }

  Future<void> edit(Iterable<TravelVisitEditModel> visits) async {
    final response = await ref.read(httpServiceProvider).request(
        'PUT', '/api/v2/travels/$travelId/visits',
        data: {'visits': visits.map((visit) => visit.toJson()).toList()});

    final newVisits = TravelVisitModel.listFromJson(response);

    final visitPlaces = await Future.wait(newVisits.map((visit) async =>
        TravelVisitWithPlaceModel(
            visit: visit,
            place: await ref.watch(placeProvider(visit.placeId).future))));

    state = state?.copyWith(visitPlaces: visitPlaces);
  }

  void selectDate(DateTime date) {
    if (state?.selectedDate == date) return;
    state = state?.copyWith(selectedDate: date);
  }
}
