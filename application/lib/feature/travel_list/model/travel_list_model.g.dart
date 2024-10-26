// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelListModelImpl _$$TravelListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelListModelImpl(
      travels: (json['travels'] as List<dynamic>?)
              ?.map((e) => TravelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TravelListModelImplToJson(
        _$TravelListModelImpl instance) =>
    <String, dynamic>{
      'travels': instance.travels,
    };
