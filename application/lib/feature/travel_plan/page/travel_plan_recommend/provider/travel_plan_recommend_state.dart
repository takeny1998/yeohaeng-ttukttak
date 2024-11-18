import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/model/place_recommend_model.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_plan_recommend_state.freezed.dart';

@freezed
class TravelPlanRecommendState with _$TravelPlanRecommendState {
  const TravelPlanRecommendState._();

  const factory TravelPlanRecommendState({
    required TravelModel travel,
    required CityModel city,
    required List<PlaceRecommendModel> placeRecommends,
    required bool hasNextPage,
    required bool hasMoreTravel,
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