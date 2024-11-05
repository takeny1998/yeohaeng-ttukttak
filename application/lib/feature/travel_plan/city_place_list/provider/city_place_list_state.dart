import 'package:application_new/shared/model/place_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_place_list_state.freezed.dart';
part 'city_place_list_state.g.dart';

@freezed
class CityPlaceListState with _$CityPlaceListState {
  const factory CityPlaceListState({
    @Default([]) List<PlaceMetricModel> placeMetrics,
    @Default(true) bool hasNextPage,
    @Default(PlaceSortType.rating) PlaceSortType sortType,
  }) = _CityPlaceListState;
}

@freezed
class PlaceMetricModel with _$PlaceMetricModel {
  const factory PlaceMetricModel({
    required PlaceModel place,
    required int visitCount,
    double? rating,
  }) = _PlaceMetricsModel;

  factory PlaceMetricModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceMetricModelFromJson(json);
}

enum PlaceSortType { rating, popularity }
