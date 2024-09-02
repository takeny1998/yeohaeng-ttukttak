// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OAuthRegisterResponseImpl _$$OAuthRegisterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OAuthRegisterResponseImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
    );

Map<String, dynamic> _$$OAuthRegisterResponseImplToJson(
        _$OAuthRegisterResponseImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
    };
