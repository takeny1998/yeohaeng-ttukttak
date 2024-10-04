// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_companion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelCompanionImpl _$$TravelCompanionImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelCompanionImpl(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$TravelCompanionTypeEnumMap, json['type']),
      ageGroup: $enumDecode(_$AgeGroupEnumMap, json['ageGroup']),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$$TravelCompanionImplToJson(
        _$TravelCompanionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TravelCompanionTypeEnumMap[instance.type]!,
      'ageGroup': _$AgeGroupEnumMap[instance.ageGroup]!,
      'gender': _$GenderEnumMap[instance.gender]!,
    };

const _$TravelCompanionTypeEnumMap = {
  TravelCompanionType.spouse: 'spouse',
  TravelCompanionType.children: 'children',
  TravelCompanionType.parents: 'parents',
  TravelCompanionType.grandparents: 'grandparents',
  TravelCompanionType.siblings: 'siblings',
  TravelCompanionType.relatives: 'relatives',
  TravelCompanionType.friends: 'friends',
  TravelCompanionType.lover: 'lover',
  TravelCompanionType.colleagues: 'colleagues',
  TravelCompanionType.members: 'members',
  TravelCompanionType.others: 'others',
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
  AgeGroup.none: 'none',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.none: 'none',
};
