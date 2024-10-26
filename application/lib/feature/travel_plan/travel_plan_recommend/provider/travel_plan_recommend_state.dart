import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/recommend_model.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_plan_recommend_state.freezed.dart';

@freezed
class TravelPlanRecommendState with _$TravelPlanRecommendState {
  const TravelPlanRecommendState._();

  const factory TravelPlanRecommendState({
    @Default([]) List<RecommendModel> recommendations,
    @Default(true) bool hasNextPage,
  }) = _TravelPlanRecommendState;
}

sealed class RecommendTarget {
  final PlaceCategory category;
  final int pageNumber;

  RecommendTarget({required this.category, this.pageNumber = 0});

  RecommendTarget nextPage();
}

final class MotivationTarget extends RecommendTarget {
  final TravelMotivation motivation;
  MotivationTarget(
      {required this.motivation, required super.category, super.pageNumber});

  @override
  RecommendTarget nextPage() {
    return MotivationTarget(
        motivation: motivation, category: category, pageNumber: pageNumber + 1);
  }
}

final class CompanionTypeTarget extends RecommendTarget {
  final TravelCompanionType companionType;
  CompanionTypeTarget(
      {required this.companionType, required super.category, super.pageNumber});

  @override
  RecommendTarget nextPage() {
    return CompanionTypeTarget(
        companionType: companionType,
        category: category,
        pageNumber: pageNumber + 1);
  }
}

final class PopularityTarget extends RecommendTarget {

  PopularityTarget ({required super.category, super.pageNumber});

  @override
  RecommendTarget nextPage() {
    return PopularityTarget(category: category, pageNumber: pageNumber + 1);
  }

}
