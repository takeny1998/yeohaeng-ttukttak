// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerSuccessResponseImpl _$$ServerSuccessResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerSuccessResponseImpl(
      data: json['data'] as Map<String, dynamic>? ?? const {},
      $type: json['status'] as String?,
    );

Map<String, dynamic> _$$ServerSuccessResponseImplToJson(
        _$ServerSuccessResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.$type,
    };

_$ServerFailResponseImpl _$$ServerFailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerFailResponseImpl(
      message: json['message'] as String,
      data: (json['data'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      $type: json['status'] as String?,
    );

Map<String, dynamic> _$$ServerFailResponseImplToJson(
        _$ServerFailResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.$type,
    };

_$ServerErrorResponseImpl _$$ServerErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerErrorResponseImpl(
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
      $type: json['status'] as String?,
    );

Map<String, dynamic> _$$ServerErrorResponseImplToJson(
        _$ServerErrorResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'status': instance.$type,
    };
