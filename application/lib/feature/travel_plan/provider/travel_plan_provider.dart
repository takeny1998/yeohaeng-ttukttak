import 'package:application_new/feature/travel_plan/provider/travel_plan_state.dart';
import 'package:application_new/shared/provider/travel_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_plan_provider.g.dart';

@riverpod
class TravelPlan extends _$TravelPlan {
  @override
   TravelPlanState build(int travelId) {

    final detail = ref.watch(travelProvider(travelId));

    return TravelPlanState(detail: detail);
  }

}
