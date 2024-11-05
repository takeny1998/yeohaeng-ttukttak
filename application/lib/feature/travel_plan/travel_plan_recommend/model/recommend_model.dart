import 'package:application_new/shared/model/place_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';

import '../provider/travel_plan_recommend_state.dart';


sealed class RecommendModel {
  final bool hasNextPage;

  RecommendModel({this.hasNextPage = false});
}

final class RecommendPlaceModel extends RecommendModel {
  final PlaceCategoryType category;
  final List<PlaceModel> places;

  RecommendPlaceModel({required this.category, required this.places, super.hasNextPage});


  static RecommendPlaceModel fromJson(PlaceCategoryType categoryType, Map<String, dynamic> json) {

    return RecommendPlaceModel(
        category: categoryType,
        places: List.of(json['places'])
            .map((json) => PlaceModel.fromJson(json))
            .toList(),
        hasNextPage: json['hasNextPage']);
  }

}

final class RecommendTravelModel extends RecommendModel {

  final List<TravelModel> travels;

  RecommendTravelModel({super.hasNextPage, required this.travels});

  static RecommendTravelModel fromJson(Map<String, dynamic> json) {
    return RecommendTravelModel(
        hasNextPage: json['hasNextPage'],
        travels: List.of(json['travels'])
            .map((travel) => TravelModel.fromJson(travel))
            .toList());
  }

}
