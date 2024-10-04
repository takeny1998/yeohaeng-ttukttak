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
      ageGroup: $enumDecode(_$AgeGroupEnumMap, json['ageGroup']),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      companions: (json['companions'] as List<dynamic>)
          .map((e) => TravelCompanion.fromJson(e as Map<String, dynamic>))
          .toList(),
      motivations: (json['motivations'] as List<dynamic>)
          .map((e) => $enumDecode(_$TravelMotivationEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$TravelModelImplToJson(_$TravelModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startedOn': instance.startedOn.toIso8601String(),
      'endedOn': instance.endedOn.toIso8601String(),
      'ageGroup': _$AgeGroupEnumMap[instance.ageGroup]!,
      'gender': _$GenderEnumMap[instance.gender]!,
      'companions': instance.companions,
      'motivations': instance.motivations
          .map((e) => _$TravelMotivationEnumMap[e]!)
          .toList(),
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
};
