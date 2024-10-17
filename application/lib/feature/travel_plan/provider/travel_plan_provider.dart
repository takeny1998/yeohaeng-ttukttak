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
    final isIndexInRange = 0 <= pageIndex && pageIndex <= 3;

    if (!isIndexInRange || state.pageIndex == pageIndex) return;

    state = state.copyWith(
      pageIndex: pageIndex
    );
  }

}
