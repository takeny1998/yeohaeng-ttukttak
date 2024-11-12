import 'package:application_new/shared/model/travel/travel_detail_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_plan_state.freezed.dart';

@freezed
class TravelPlanState with _$TravelPlanState {
  const TravelPlanState._();

  const factory TravelPlanState({
    @Default(0) int pageIndex,
    @Default(0) int cityIndex,
  }) = _TravelPlanState;

}
