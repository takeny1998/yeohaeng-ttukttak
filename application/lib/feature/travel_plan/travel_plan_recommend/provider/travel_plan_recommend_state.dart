import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/recommend_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_plan_recommend_state.freezed.dart';

@freezed
class TravelPlanRecommendState with _$TravelPlanRecommendState {
  const TravelPlanRecommendState._();

  const factory TravelPlanRecommendState({
    @Default([]) List<RecommendModel> recommendations,
  }) = _TravelPlanRecommendState;

}

sealed class RecommendTarget {}

final class MotivationTarget extends RecommendTarget {
  final TravelMotivation motivation;
  MotivationTarget({required this.motivation});
}

final class CompanionTypeTarget extends RecommendTarget {
  final TravelCompanionType companionType;
  CompanionTypeTarget({required this.companionType});
}
