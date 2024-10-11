import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class PlaceModel with _$PlaceModel {

  const factory PlaceModel({
    required int id,
    required String name,
    required PlaceAddress address,
    required PlaceCoordinates coordinates,
    required List<PlaceCategory> categories,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);

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

  const factory PlaceAddress({
    required String lotNumber,
    required String road
  }) = _PlaceAddress;

  factory PlaceAddress.fromJson(Map<String, dynamic> json) =>
      _$PlaceAddressFromJson(json);

}


enum PlaceCategory {
  nature,
  heritage,
  culture,
  commerce,
  recreation,
  themePark,
  trail,
  festival,
  transport,
  shop,
  dining,
  attraction,
  lodging,
  other
}