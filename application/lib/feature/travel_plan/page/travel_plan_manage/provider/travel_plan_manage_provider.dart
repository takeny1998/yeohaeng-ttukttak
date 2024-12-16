import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_model.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
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
        .request('GET', '/api/v2/travels/$travelId/plans');

    final travel = await ref.watch(travelProvider(travelId).future);

    state = TravelPlanManageState(
      travel: travel,
      selectedDate: travel.startedOn,
      plans: TravelPlanModel.listFromJson(response),
    );
  }

  void selectDate(DateTime date) {
    if (state?.selectedDate == date) return;
    state = state?.copyWith(selectedDate: date);
  }

  void updateDraggingIndex(int? index) {
    if (state?.draggingIndex == index) return;
    state = state?.copyWith(draggingIndex: index);
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

      state = state!
          .copyWith(isAnimating: true, mapHeightLevel: mapHeightLevel + 1);
    } else {
      if (mapHeightLevel == 0) return;

      state = state!
          .copyWith(isAnimating: true, mapHeightLevel: mapHeightLevel - 1);
    }
  }

  Future<void> move(TravelPlanModel from, int order) async {

    state = state?.copyWith(draggingIndex: null);

    if (state == null) return;

    final newPlans =
        await ref.read(asyncLoadingProvider.notifier).guard(() async {
      final auth = await ref.read(authServiceProvider).find();

      final selectedDate = state!.selectedDate;

      final response = await ref.read(httpServiceProvider).request(
        'PATCH',
        '/api/v2/travels/$travelId/plans/${from.id}',
        authorization: auth.accessToken,
        data: {
          'orderOfVisit': order,
          'willVisitOn': selectedDate.toIso8601String(),
        },
      );

      return TravelPlanModel.listFromJson(response);
    });

    state = state!.copyWith(plans: newPlans);
  }

  Future<void> delete(TravelPlanModel plan) async {
    if (state == null) return;

    await ref.read(asyncLoadingProvider.notifier).guard(() async {
      final auth = await ref.read(authServiceProvider).find();

      await ref.read(httpServiceProvider).request(
            'DELETE',
            '/api/v2/travels/$travelId/plans/${plan.id}',
            authorization: auth.accessToken,
          );
    });

    final newPlans = List.of(state!.plans)..remove(plan);
    state = state!.copyWith(plans: newPlans);
  }

  Future<void> create(int placeId, int dayOfTravel) async {
    var loadingNotifier = ref.read(asyncLoadingProvider.notifier);

    final newPlans = await loadingNotifier.guard(() async {
      final auth = await ref.read(authServiceProvider).find();
      final response = await ref.read(httpServiceProvider).request(
        'POST',
        '/api/v2/travels/$travelId/plans',
        authorization: auth.accessToken,
        data: {
          'placeId': placeId,
          'dayOfTravel': dayOfTravel,
        },
      );

      return TravelPlanModel.listFromJson(response);
    });

    state = state!.copyWith(plans: newPlans);
  }
}
