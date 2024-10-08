// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceModelImpl _$$PlaceModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaceModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      coordinates: PlaceCoordinates.fromJson(
          json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlaceModelImplToJson(_$PlaceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coordinates': instance.coordinates,
    };

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
