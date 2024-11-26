// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_invitation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelInvitationModelImpl _$$TravelInvitationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelInvitationModelImpl(
      id: json['id'] as String,
      travelId: (json['travelId'] as num).toInt(),
    );

Map<String, dynamic> _$$TravelInvitationModelImplToJson(
        _$TravelInvitationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'travelId': instance.travelId,
    };
