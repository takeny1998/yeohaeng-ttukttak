import 'package:application_new/domain/travel/travel_plan/travel_plan_comment_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_plan_comment_state.freezed.dart';

@freezed
class TravelPlanCommentState with _$TravelPlanCommentState {

  const factory TravelPlanCommentState({
    @Default([]) List<TravelPlanCommentModel> comments,
  }) = _TravelPlanCommentState;

}