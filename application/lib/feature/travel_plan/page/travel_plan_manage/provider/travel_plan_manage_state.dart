import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_plan_manage_state.freezed.dart';

@freezed
class TravelPlanManageState with _$TravelPlanManageState {
  const factory TravelPlanManageState({
    required TravelModel travel,
    required List<TravelVisitWithPlaceModel> visitPlaces,
    required DateTime selectedDate,
  }) = _TravelPlanManageState;
}
