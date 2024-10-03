import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_coordinates.freezed.dart';
part 'place_coordinates.g.dart';

@freezed
class PlaceCoordinates with _$PlaceCoordinates {

  const factory PlaceCoordinates({
    required double longitude,
    required double latitude
  }) = _PlaceCoordinates;

  factory PlaceCoordinates.fromJson(Map<String, dynamic> json) =>
      _$PlaceCoordinatesFromJson(json);

}