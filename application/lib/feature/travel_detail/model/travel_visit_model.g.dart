// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_visit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelVisitModelImpl _$$TravelVisitModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelVisitModelImpl(
      id: (json['id'] as num).toInt(),
      seq: (json['seq'] as num).toInt(),
      placeId: (json['placeId'] as num).toInt(),
      visitedOn: DateTime.parse(json['visitedOn'] as String),
      rating: TravelVisitRatingModel.fromJson(
          json['rating'] as Map<String, dynamic>),
      reason: $enumDecode(_$TravelVisitReasonEnumMap, json['reason']),
    );

Map<String, dynamic> _$$TravelVisitModelImplToJson(
        _$TravelVisitModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seq': instance.seq,
      'placeId': instance.placeId,
      'visitedOn': instance.visitedOn.toIso8601String(),
      'rating': instance.rating,
      'reason': _$TravelVisitReasonEnumMap[instance.reason]!,
    };

const _$TravelVisitReasonEnumMap = {
  TravelVisitReason.landmark: 'landmark',
  TravelVisitReason.goodReviews: 'goodReviews',
  TravelVisitReason.media: 'media',
  TravelVisitReason.goodExperience: 'goodExperience',
  TravelVisitReason.recommendation: 'recommendation',
  TravelVisitReason.easyAccess: 'easyAccess',
  TravelVisitReason.goodAmenities: 'goodAmenities',
  TravelVisitReason.goodValue: 'goodValue',
  TravelVisitReason.unexpectedFind: 'unexpectedFind',
  TravelVisitReason.education: 'education',
  TravelVisitReason.other: 'other',
};
