import 'package:application_new/shared/model/place_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';

import '../provider/travel_plan_recommend_state.dart';


sealed class RecommendModel {
  final bool hasNextPage;

  RecommendModel({this.hasNextPage = false});
}

final class RecommendPlaceModel extends RecommendModel {
  final PlaceTarget target;
  final PlaceCategoryType category;
  final List<PlaceModel> places;

  RecommendPlaceModel({required this.target, required this.category, required this.places, super.hasNextPage});

}

final class RecommendTravelModel extends RecommendModel {

  final List<TravelModel> travels;

  RecommendTravelModel({super.hasNextPage, required this.travels});

}
