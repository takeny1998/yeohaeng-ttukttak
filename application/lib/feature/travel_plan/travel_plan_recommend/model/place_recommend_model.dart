import 'package:application_new/domain/place/place_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'place_recommend_model.freezed.dart';

@freezed
class PlaceRecommendModel with _$PlaceRecommendModel {
  const factory PlaceRecommendModel({
    required PlaceCategoryType categoryType,
    required List<PlaceModel> places,
  }) = _PlaceRecommendModel;

  static PlaceRecommendModel fromJson(PlaceCategoryType categoryType,
      Map<String, dynamic> json) {
    return PlaceRecommendModel(
        categoryType: categoryType,
        places: List.of(json['places'])
            .map((place) => PlaceModel.fromJson(place))
            .toList());
  }
}
