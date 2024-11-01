// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelModelImpl _$$TravelModelImplFromJson(Map<String, dynamic> json) =>
    _$TravelModelImpl(
      id: (json['id'] as num).toInt(),
      startedOn: DateTime.parse(json['startedOn'] as String),
      endedOn: DateTime.parse(json['endedOn'] as String),
      companionType: $enumDecodeNullable(
              _$TravelCompanionTypeEnumMap, json['companionType']) ??
          TravelCompanionType.none,
      ageGroup: $enumDecodeNullable(_$AgeGroupEnumMap, json['ageGroup']) ??
          AgeGroup.none,
      gender:
          $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.none,
      companions: (json['companions'] as List<dynamic>?)
              ?.map((e) => TravelCompanion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      motivations: (json['motivations'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$TravelMotivationEnumMap, e))
              .toList() ??
          const [],
      cities: (json['cities'] as List<dynamic>?)
              ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TravelModelImplToJson(_$TravelModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startedOn': instance.startedOn.toIso8601String(),
      'endedOn': instance.endedOn.toIso8601String(),
      'companionType': _$TravelCompanionTypeEnumMap[instance.companionType]!,
      'ageGroup': _$AgeGroupEnumMap[instance.ageGroup]!,
      'gender': _$GenderEnumMap[instance.gender]!,
      'companions': instance.companions,
      'motivations': instance.motivations
          .map((e) => _$TravelMotivationEnumMap[e]!)
          .toList(),
      'cities': instance.cities,
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
  TravelCompanionType.none: 'none',
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

const _$TravelMotivationEnumMap = {
  TravelMotivation.adventure: 'adventure',
  TravelMotivation.rest: 'rest',
  TravelMotivation.friendship: 'friendship',
  TravelMotivation.selfReflection: 'selfReflection',
  TravelMotivation.socialNetwork: 'socialNetwork',
  TravelMotivation.fitness: 'fitness',
  TravelMotivation.newExperiences: 'newExperiences',
  TravelMotivation.education: 'education',
  TravelMotivation.special: 'special',
  TravelMotivation.other: 'other',
};

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
