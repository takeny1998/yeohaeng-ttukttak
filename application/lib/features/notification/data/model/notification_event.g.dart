// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewLoginDetectedEventImpl _$$NewLoginDetectedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$NewLoginDetectedEventImpl(
      deviceName: json['device_name'] as String,
      loggedInAt: DateTime.parse(json['logged_in_at'] as String),
    );

Map<String, dynamic> _$$NewLoginDetectedEventImplToJson(
        _$NewLoginDetectedEventImpl instance) =>
    <String, dynamic>{
      'device_name': instance.deviceName,
      'logged_in_at': instance.loggedInAt.toIso8601String(),
    };