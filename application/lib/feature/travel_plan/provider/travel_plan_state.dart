import 'package:application_new/domain/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_plan_state.freezed.dart';

@freezed
class TravelPlanState with _$TravelPlanState {
  const TravelPlanState._();

  const factory TravelPlanState({
    required TravelModel travel,
    @Default(0) int pageIndex,
    @Default(0) int cityIndex,
    @Default(0.0) double appBarHeight,
  }) = _TravelPlanState;

}
