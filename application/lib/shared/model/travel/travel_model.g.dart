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
      ageGroup: $enumDecodeNullable(_$AgeGroupEnumMap, json['ageGroup']) ??
          AgeGroup.none,
      gender:
          $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.none,
      companions: (json['companions'] as List<dynamic>?)
              ?.map((e) => TravelCompanionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      motivationTypes: (json['motivationTypes'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$TravelMotivationTypeEnumMap, e))
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
      'ageGroup': _$AgeGroupEnumMap[instance.ageGroup]!,
      'gender': _$GenderEnumMap[instance.gender]!,
      'companions': instance.companions,
      'motivationTypes': instance.motivationTypes
          .map((e) => _$TravelMotivationTypeEnumMap[e]!)
          .toList(),
      'cities': instance.cities,
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

const _$TravelMotivationTypeEnumMap = {
  TravelMotivationType.adventure: 'adventure',
  TravelMotivationType.rest: 'rest',
  TravelMotivationType.friendship: 'friendship',
  TravelMotivationType.selfReflection: 'selfReflection',
  TravelMotivationType.socialNetwork: 'socialNetwork',
  TravelMotivationType.fitness: 'fitness',
  TravelMotivationType.newExperiences: 'newExperiences',
  TravelMotivationType.education: 'education',
  TravelMotivationType.special: 'special',
  TravelMotivationType.other: 'other',
};

_$TravelCompanionImpl _$$TravelCompanionImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelCompanionImpl(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$TravelCompanionTypeEnumMap, json['type']),
      ageGroup: $enumDecodeNullable(_$AgeGroupEnumMap, json['ageGroup']),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$$TravelCompanionImplToJson(
        _$TravelCompanionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TravelCompanionTypeEnumMap[instance.type]!,
      'ageGroup': _$AgeGroupEnumMap[instance.ageGroup],
      'gender': _$GenderEnumMap[instance.gender],
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
