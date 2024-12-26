// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelModelImpl _$$TravelModelImplFromJson(Map<String, dynamic> json) =>
    _$TravelModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      startedOn: DateTime.parse(json['startedOn'] as String),
      endedOn: DateTime.parse(json['endedOn'] as String),
      memberId: json['memberId'] as String,
      companionTypes: (json['companionTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$TravelCompanionTypeEnumMap, e))
          .toList(),
      motivationTypes: (json['motivationTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$TravelMotivationTypeEnumMap, e))
          .toList(),
      cities: (json['cities'] as List<dynamic>)
          .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TravelModelImplToJson(_$TravelModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startedOn': instance.startedOn.toIso8601String(),
      'endedOn': instance.endedOn.toIso8601String(),
      'memberId': instance.memberId,
      'companionTypes': instance.companionTypes
          .map((e) => _$TravelCompanionTypeEnumMap[e]!)
          .toList(),
      'motivationTypes': instance.motivationTypes
          .map((e) => _$TravelMotivationTypeEnumMap[e]!)
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

_$TravelParticipantModelImpl _$$TravelParticipantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelParticipantModelImpl(
      id: (json['id'] as num).toInt(),
      travelId: (json['travelId'] as num).toInt(),
      inviteeId: json['inviteeId'] as String,
      inviterId: json['inviterId'] as String,
    );

Map<String, dynamic> _$$TravelParticipantModelImplToJson(
        _$TravelParticipantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'travelId': instance.travelId,
      'inviteeId': instance.inviteeId,
      'inviterId': instance.inviterId,
    };
