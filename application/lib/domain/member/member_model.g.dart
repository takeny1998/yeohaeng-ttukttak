// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberModelImpl _$$MemberModelImplFromJson(Map<String, dynamic> json) =>
    _$MemberModelImpl(
      uuid: json['uuid'] as String,
      nickname: json['nickname'] as String,
      avatar: AvatarModel.fromJson(json['avatar'] as Map<String, dynamic>),
      ageGroup: $enumDecodeNullable(_$AgeGroupEnumMap, json['ageGroup']),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$$MemberModelImplToJson(_$MemberModelImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'ageGroup': _$AgeGroupEnumMap[instance.ageGroup],
      'gender': _$GenderEnumMap[instance.gender],
    };

const _$AgeGroupEnumMap = {
  AgeGroup.underNine: 'underNine',
  AgeGroup.teens: 'teens',
  AgeGroup.twenties: 'twenties',
  AgeGroup.thirties: 'thirties',
  AgeGroup.forties: 'forties',
  AgeGroup.fifties: 'fifties',
  AgeGroup.sixties: 'sixties',
  AgeGroup.seventiesPlus: 'seventiesPlus',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};

_$AvatarModelImpl _$$AvatarModelImplFromJson(Map<String, dynamic> json) =>
    _$AvatarModelImpl(
      host: json['host'] as String,
      path: json['path'] as String,
      ext: json['ext'] as String,
    );

Map<String, dynamic> _$$AvatarModelImplToJson(_$AvatarModelImpl instance) =>
    <String, dynamic>{
      'host': instance.host,
      'path': instance.path,
      'ext': instance.ext,
    };
