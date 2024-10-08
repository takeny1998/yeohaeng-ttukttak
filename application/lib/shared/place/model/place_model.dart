import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class PlaceModel with _$PlaceModel {

  const factory PlaceModel({
    required int id,
    required String name,
    required PlaceCoordinates coordinates,
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