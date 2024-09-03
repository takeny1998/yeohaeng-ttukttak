// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerSuccessResponseImpl<T> _$$ServerSuccessResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ServerSuccessResponseImpl<T>(
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$$ServerSuccessResponseImplToJson<T>(
  _$ServerSuccessResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
    };

_$ServerErrorResponseImpl _$$ServerErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerErrorResponseImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      target: json['target'] as String?,
    );

Map<String, dynamic> _$$ServerErrorResponseImplToJson(
        _$ServerErrorResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'target': instance.target,
    };
