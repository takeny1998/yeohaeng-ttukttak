import 'package:application_new/common/util/list_utils.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_state.dart';
import 'package:application_new/shared/provider/travel_detail_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_plan_provider.g.dart';

@riverpod
class TravelPlan extends _$TravelPlan {
  @override
  TravelPlanState build(int travelId) {
    final detail = ref.watch(travelDetailProvider(travelId));
    return TravelPlanState(detail: detail);
  }

  void changePage(int pageIndex) {
    if (!ListUtils.isIndexInRange(pageIndex, end: 3)) return;

    state = state.copyWith(
      pageIndex: pageIndex,
    );
  }

  void selectCity(int cityIndex) {
    if (state.cityIndex == cityIndex) return;

    final cityCount = state.detail.travel.cities.length;
    if (!ListUtils.isIndexInRange(cityIndex, end: cityCount - 1)) return;

    state = state.copyWith(
      cityIndex: cityIndex,
    );
  }

}
