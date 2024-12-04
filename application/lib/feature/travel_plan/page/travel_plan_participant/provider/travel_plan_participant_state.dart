import 'package:application_new/domain/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_plan_participant_state.freezed.dart';

@freezed
class TravelPlanParticipantState with _$TravelPlanParticipantState {

  const factory TravelPlanParticipantState({
    required TravelModel travel,
    required List<TravelParticipantModel> participants,
  }) = _TravelPlanParticipantState;

}