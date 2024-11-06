// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_place_pois_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceMetricsModelImpl _$$PlaceMetricsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceMetricsModelImpl(
      place: PlaceModel.fromJson(json['place'] as Map<String, dynamic>),
      visitCount: (json['visitCount'] as num).toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PlaceMetricsModelImplToJson(
        _$PlaceMetricsModelImpl instance) =>
    <String, dynamic>{
      'place': instance.place,
      'visitCount': instance.visitCount,
      'rating': instance.rating,
    };
