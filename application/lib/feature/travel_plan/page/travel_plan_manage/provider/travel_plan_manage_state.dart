import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_model.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_plan_manage_state.freezed.dart';

@freezed
class TravelPlanManageState with _$TravelPlanManageState {
  const factory TravelPlanManageState({
    required TravelModel travel,
    required List<TravelPlanModel> plans,
    required DateTime selectedDate,
    @Default(1) int mapHeightLevel,
    @Default(false) bool isAnimating,
    int? draggingIndex,
  }) = _TravelPlanManageState;
}
