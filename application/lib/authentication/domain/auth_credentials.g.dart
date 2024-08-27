// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthCredentialsImpl _$$AuthCredentialsImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthCredentialsImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$AuthCredentialsImplToJson(
        _$AuthCredentialsImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
