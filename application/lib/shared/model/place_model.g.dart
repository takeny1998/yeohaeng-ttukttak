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
          .map((e) => $enumDecode(_$PlaceCategoryEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$PlaceModelImplToJson(_$PlaceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'coordinates': instance.coordinates,
      'categories':
          instance.categories.map((e) => _$PlaceCategoryEnumMap[e]!).toList(),
    };

const _$PlaceCategoryEnumMap = {
  PlaceCategory.nature: 'nature',
  PlaceCategory.landmark: 'landmark',
  PlaceCategory.culture: 'culture',
  PlaceCategory.commerce: 'commerce',
  PlaceCategory.recreation: 'recreation',
  PlaceCategory.themePark: 'themePark',
  PlaceCategory.trail: 'trail',
  PlaceCategory.festival: 'festival',
  PlaceCategory.transport: 'transport',
  PlaceCategory.shop: 'shop',
  PlaceCategory.dining: 'dining',
  PlaceCategory.attraction: 'attraction',
  PlaceCategory.lodging: 'lodging',
  PlaceCategory.other: 'other',
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
