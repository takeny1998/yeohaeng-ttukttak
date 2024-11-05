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
      reasonType:
          $enumDecode(_$TravelVisitReasonTypeEnumMap, json['reasonType']),
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TravelVisitModelImplToJson(
        _$TravelVisitModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seq': instance.seq,
      'placeId': instance.placeId,
      'visitedOn': instance.visitedOn.toIso8601String(),
      'rating': instance.rating,
      'reasonType': _$TravelVisitReasonTypeEnumMap[instance.reasonType]!,
      'images': instance.images,
    };

const _$TravelVisitReasonTypeEnumMap = {
  TravelVisitReasonType.landmark: 'landmark',
  TravelVisitReasonType.goodReviews: 'goodReviews',
  TravelVisitReasonType.media: 'media',
  TravelVisitReasonType.goodExperience: 'goodExperience',
  TravelVisitReasonType.recommendation: 'recommendation',
  TravelVisitReasonType.easyAccess: 'easyAccess',
  TravelVisitReasonType.goodAmenities: 'goodAmenities',
  TravelVisitReasonType.goodValue: 'goodValue',
  TravelVisitReasonType.unexpectedFind: 'unexpectedFind',
  TravelVisitReasonType.education: 'education',
  TravelVisitReasonType.other: 'other',
};

_$TravelVisitRatingModelImpl _$$TravelVisitRatingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelVisitRatingModelImpl(
      satisfaction: (json['satisfaction'] as num).toInt(),
      revisit: (json['revisit'] as num).toInt(),
      recommend: (json['recommend'] as num).toInt(),
    );

Map<String, dynamic> _$$TravelVisitRatingModelImplToJson(
        _$TravelVisitRatingModelImpl instance) =>
    <String, dynamic>{
      'satisfaction': instance.satisfaction,
      'revisit': instance.revisit,
      'recommend': instance.recommend,
    };
