// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_visit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelVisitModelImpl _$$TravelVisitModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelVisitModelImpl(
      id: (json['id'] as num).toInt(),
      placeId: (json['placeId'] as num).toInt(),
      rating: TravelVisitRatingModel.fromJson(
          json['rating'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      visitedOn: json['visitedOn'] == null
          ? null
          : DateTime.parse(json['visitedOn'] as String),
      orderOfVisit: (json['orderOfVisit'] as num?)?.toInt(),
      reasonType: $enumDecodeNullable(
          _$TravelVisitReasonTypeEnumMap, json['reasonType']),
    );

Map<String, dynamic> _$$TravelVisitModelImplToJson(
        _$TravelVisitModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeId': instance.placeId,
      'rating': instance.rating,
      'images': instance.images,
      'visitedOn': instance.visitedOn?.toIso8601String(),
      'orderOfVisit': instance.orderOfVisit,
      'reasonType': _$TravelVisitReasonTypeEnumMap[instance.reasonType],
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
      satisfaction: (json['satisfaction'] as num?)?.toInt(),
      revisit: (json['revisit'] as num?)?.toInt(),
      recommend: (json['recommend'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TravelVisitRatingModelImplToJson(
        _$TravelVisitRatingModelImpl instance) =>
    <String, dynamic>{
      'satisfaction': instance.satisfaction,
      'revisit': instance.revisit,
      'recommend': instance.recommend,
    };

_$TravelVisitFormImpl _$$TravelVisitFormImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelVisitFormImpl(
      placeId: (json['placeId'] as num).toInt(),
      dayOfTravel: (json['dayOfTravel'] as num).toInt(),
    );

Map<String, dynamic> _$$TravelVisitFormImplToJson(
        _$TravelVisitFormImpl instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'dayOfTravel': instance.dayOfTravel,
    };

_$TravelVisitPlanModelImpl _$$TravelVisitPlanModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelVisitPlanModelImpl(
      id: (json['id'] as num).toInt(),
      orderOfVisit: (json['orderOfVisit'] as num).toInt(),
      dayOfTravel: (json['dayOfTravel'] as num).toInt(),
    );

Map<String, dynamic> _$$TravelVisitPlanModelImplToJson(
        _$TravelVisitPlanModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderOfVisit': instance.orderOfVisit,
      'dayOfTravel': instance.dayOfTravel,
    };
