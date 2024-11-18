// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_travels_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PagedTravelsModelImpl _$$PagedTravelsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PagedTravelsModelImpl(
      travels: (json['travels'] as List<dynamic>?)
              ?.map((e) => TravelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasNextPage: json['hasNextPage'] ?? false,
    );

Map<String, dynamic> _$$PagedTravelsModelImplToJson(
        _$PagedTravelsModelImpl instance) =>
    <String, dynamic>{
      'travels': instance.travels,
      'hasNextPage': instance.hasNextPage,
    };
