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
      data: json['data'] as Map<String, dynamic>? ?? const {},
      $type: json['status'] as String?,
    );

Map<String, dynamic> _$$ServerFailResponseImplToJson(
        _$ServerFailResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.$type,
    };

_$ServerErrorResponseImpl _$$ServerErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerErrorResponseImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      $type: json['status'] as String?,
    );

Map<String, dynamic> _$$ServerErrorResponseImplToJson(
        _$ServerErrorResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.$type,
    };
