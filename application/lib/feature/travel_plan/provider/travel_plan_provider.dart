import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_state.dart';
import 'package:application_new/domain/travel/travel_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_plan_provider.g.dart';

@riverpod
class TravelPlan extends _$TravelPlan {

  @override
  TravelPlanState? build(int travelId) {

    final travel = ref.watch(travelProvider(travelId)).value;

    if (travel == null) return null;

    return TravelPlanState(travel: travel);
  }

  void changePage(int pageIndex) {
    if (state == null || !IterableUtil.isIndexInRange(pageIndex, end: 3)) {
      return;
    }

    state = state?.copyWith(
      pageIndex: pageIndex,
    );
  }

  void selectCity(int cityIndex) {
    if (state == null || state?.cityIndex == cityIndex) return;

    final cityCount = state!.travel.cities.length;
    if (!IterableUtil.isIndexInRange(cityIndex, end: cityCount - 1)) return;

    state = state?.copyWith(
      cityIndex: cityIndex,
    );
  }
}
