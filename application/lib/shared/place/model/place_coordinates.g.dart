// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceCoordinatesImpl _$$PlaceCoordinatesImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceCoordinatesImpl(
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlaceCoordinatesImplToJson(
        _$PlaceCoordinatesImpl instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
