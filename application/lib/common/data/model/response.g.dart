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
      $type: json['status'] as String?,
    );

Map<String, dynamic> _$$ServerSuccessResponseImplToJson<T>(
  _$ServerSuccessResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'status': instance.$type,
    };

_$ServerFailResponseImpl<T> _$$ServerFailResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ServerFailResponseImpl<T>(
      message: json['message'] as String?,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      $type: json['status'] as String?,
    );

Map<String, dynamic> _$$ServerFailResponseImplToJson<T>(
  _$ServerFailResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.$type,
    };

_$ServerErrorResponseImpl<T> _$$ServerErrorResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ServerErrorResponseImpl<T>(
      message: json['message'] as String,
      code: (json['code'] as num?)?.toInt(),
      $type: json['status'] as String?,
    );

Map<String, dynamic> _$$ServerErrorResponseImplToJson<T>(
  _$ServerErrorResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'status': instance.$type,
    };
