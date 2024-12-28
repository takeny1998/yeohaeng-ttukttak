// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelPlanModelImpl _$$TravelPlanModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelPlanModelImpl(
      id: (json['id'] as num).toInt(),
      orderOfPlan: (json['orderOfPlan'] as num).toInt(),
      placeId: (json['placeId'] as num).toInt(),
      willVisitOn: DateTime.parse(json['willVisitOn'] as String),
    );

Map<String, dynamic> _$$TravelPlanModelImplToJson(
        _$TravelPlanModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderOfPlan': instance.orderOfPlan,
      'placeId': instance.placeId,
      'willVisitOn': instance.willVisitOn.toIso8601String(),
    };
