import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/shared/interfaces/IconDataProvidable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_place_pois_state.freezed.dart';
part 'city_place_pois_state.g.dart';

@freezed
class CityPlacePoisState with _$CityPlacePoisState {
  const factory CityPlacePoisState({
    required TravelModel travel,
    required CityModel city,
    @Default([]) List<PlaceMetricModel> placeMetrics,
    @Default(true) bool hasNextPage,
    @Default({}) Set<PlaceCategoryType> selectedTypes,
  }) = _CityPlacePoisState;
}

@freezed
class PlaceMetricModel with _$PlaceMetricModel {
  const factory PlaceMetricModel({
    required PlaceModel place,
    @Default(0) int visitCount,
    double? rating,
  }) = _PlaceMetricsModel;

  factory PlaceMetricModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceMetricModelFromJson(json);
}

enum PlaceSortType { rating, popularity }

enum ViewType implements IconDataEnum {
  list(Icons.view_list), map(Icons.map);

  @override
  final IconData iconData;

  const ViewType(this.iconData);
}