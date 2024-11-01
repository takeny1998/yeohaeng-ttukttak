// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceModelImpl _$$PlaceModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaceModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      address: PlaceAddress.fromJson(json['address'] as Map<String, dynamic>),
      coordinates: PlaceCoordinates.fromJson(
          json['coordinates'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => $enumDecode(_$PlaceCategoryTypeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$PlaceModelImplToJson(_$PlaceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'coordinates': instance.coordinates,
      'categories': instance.categories
          .map((e) => _$PlaceCategoryTypeEnumMap[e]!)
          .toList(),
    };

const _$PlaceCategoryTypeEnumMap = {
  PlaceCategoryType.nature: 'nature',
  PlaceCategoryType.tourism: 'tourism',
  PlaceCategoryType.culture: 'culture',
  PlaceCategoryType.commerce: 'commerce',
  PlaceCategoryType.transport: 'transport',
  PlaceCategoryType.dining: 'dining',
  PlaceCategoryType.lodging: 'lodging',
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

_$PlaceAddressImpl _$$PlaceAddressImplFromJson(Map<String, dynamic> json) =>
    _$PlaceAddressImpl(
      lotNumber: json['lotNumber'] as String,
      road: json['road'] as String,
    );

Map<String, dynamic> _$$PlaceAddressImplToJson(_$PlaceAddressImpl instance) =>
    <String, dynamic>{
      'lotNumber': instance.lotNumber,
      'road': instance.road,
    };
