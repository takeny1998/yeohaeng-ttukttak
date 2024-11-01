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
    @Default(true) bool hasMoreTravel,
  }) = _TravelPlanRecommendState;
}


abstract class RecommendTarget {
  final int pageNumber;

  RecommendTarget({this.pageNumber = 0});

  RecommendTarget nextPage();
}

sealed class PlaceTarget extends RecommendTarget {

  final PlaceCategoryType category;

  PlaceTarget({super.pageNumber, required this.category});

  @override
  PlaceTarget nextPage();
}

final class MotivationTarget extends PlaceTarget {
  final TravelMotivation motivation;
  MotivationTarget(
      {required this.motivation, required super.category, super.pageNumber});

  @override
  PlaceTarget nextPage() {
    return MotivationTarget(
        motivation: motivation, category: category, pageNumber: pageNumber + 1);
  }
}

final class CompanionTypeTarget extends PlaceTarget {
  final TravelCompanionType companionType;
  CompanionTypeTarget(
      {required this.companionType, required super.category, super.pageNumber});

  @override
  PlaceTarget nextPage() {
    return CompanionTypeTarget(
        companionType: companionType,
        category: category,
        pageNumber: pageNumber + 1);
  }
}

final class PopularityTarget extends PlaceTarget {
  PopularityTarget({required super.category, super.pageNumber});

  @override
  PlaceTarget nextPage() {
    return PopularityTarget(category: category, pageNumber: pageNumber + 1);
  }
}

final class TravelTarget extends RecommendTarget {
  final List<TravelMotivation> motivations;
  final List<TravelCompanionType> companionTypes;

  TravelTarget(
      {required this.motivations,
      required this.companionTypes,
      super.pageNumber});

  @override
  TravelTarget nextPage() {
    return TravelTarget(
        motivations: motivations,
        companionTypes: companionTypes,
        pageNumber: pageNumber + 1);
  }
}
