// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelDetailModelImpl _$$TravelDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelDetailModelImpl(
      travel: TravelModel.fromJson(json['travel'] as Map<String, dynamic>),
      visits: (json['visits'] as List<dynamic>?)
              ?.map((e) => TravelVisitModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      places: (json['places'] as List<dynamic>?)
              ?.map((e) => PlaceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TravelDetailModelImplToJson(
        _$TravelDetailModelImpl instance) =>
    <String, dynamic>{
      'travel': instance.travel,
      'visits': instance.visits,
      'places': instance.places,
    };
