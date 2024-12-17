// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_plan_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelPlanCommentModelImpl _$$TravelPlanCommentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelPlanCommentModelImpl(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastModifiedAt: json['lastModifiedAt'] == null
          ? null
          : DateTime.parse(json['lastModifiedAt'] as String),
    );

Map<String, dynamic> _$$TravelPlanCommentModelImplToJson(
        _$TravelPlanCommentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastModifiedAt': instance.lastModifiedAt?.toIso8601String(),
    };
