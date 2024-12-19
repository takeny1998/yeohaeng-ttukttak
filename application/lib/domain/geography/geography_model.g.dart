// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geography_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryModelImpl _$$CountryModelImplFromJson(Map<String, dynamic> json) =>
    _$CountryModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      parentId: (json['parentId'] as num).toInt(),
      shortName: json['shortName'] as String,
      $type: json['level'] as String?,
    );

Map<String, dynamic> _$$CountryModelImplToJson(_$CountryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'shortName': instance.shortName,
      'level': instance.$type,
    };

_$ProvinceModelImpl _$$ProvinceModelImplFromJson(Map<String, dynamic> json) =>
    _$ProvinceModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      parentId: (json['parentId'] as num).toInt(),
      shortName: json['shortName'] as String,
      insignia: ImageModel.fromJson(json['insignia'] as Map<String, dynamic>),
      $type: json['level'] as String?,
    );

Map<String, dynamic> _$$ProvinceModelImplToJson(_$ProvinceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'shortName': instance.shortName,
      'insignia': instance.insignia,
      'level': instance.$type,
    };

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      parentId: (json['parentId'] as num).toInt(),
      shortName: json['shortName'] as String,
      insignia: ImageModel.fromJson(json['insignia'] as Map<String, dynamic>),
      $type: json['level'] as String?,
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'shortName': instance.shortName,
      'insignia': instance.insignia,
      'level': instance.$type,
    };
