import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class PlaceModel with _$PlaceModel {

  const PlaceModel._();

  const factory PlaceModel({
    required int id,
    required String name,
    required PlaceAddress address,
    required PlaceCoordinates coordinates,
    required List<PlaceCategoryType> categoryTypes,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);

  static List<PlaceModel> listFromJson(Map<String, dynamic> json) =>
      List.of(json['places']).map((json) => PlaceModel.fromJson(json)).toList();

}

@freezed
class PlaceCoordinates with _$PlaceCoordinates {
  const factory PlaceCoordinates({
    required double longitude,
    required double latitude,
  }) = _PlaceCoordinates;

  factory PlaceCoordinates.fromJson(Map<String, dynamic> json) =>
      _$PlaceCoordinatesFromJson(json);
}

@freezed
class PlaceAddress with _$PlaceAddress {
  const PlaceAddress._();

  const factory PlaceAddress(
      {required String lotNumber, required String road}) = _PlaceAddress;

  factory PlaceAddress.fromJson(Map<String, dynamic> json) =>
      _$PlaceAddressFromJson(json);

  String? get value {
    if (road.isNotEmpty) return road;
    return lotNumber;
  }
}

enum PlaceCategoryType {
  nature(Icons.nature_people),
  tourism(Icons.tour),
  culture(Icons.theater_comedy),
  commerce(Icons.shopping_cart),
  transport(Icons.directions_bus),
  dining(Icons.dining),
  lodging(Icons.hotel);

  final IconData iconData;

  const PlaceCategoryType(this.iconData);

  static List<PlaceCategoryType> pois() {
    return [nature, tourism, culture, commerce, transport];
  }
}
