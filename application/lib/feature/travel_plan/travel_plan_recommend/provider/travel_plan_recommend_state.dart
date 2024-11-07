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


sealed class RecommendTarget {
  final int pageNumber;

  RecommendTarget({this.pageNumber = 0});

  RecommendTarget nextPage();
}

final class PlaceRecommendTarget extends RecommendTarget {

  final PlaceCategoryType categoryType;

  PlaceRecommendTarget({super.pageNumber, required this.categoryType});

  @override
  PlaceRecommendTarget nextPage() {
    return PlaceRecommendTarget(categoryType: categoryType, pageNumber: pageNumber + 1);
  }
}