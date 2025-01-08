// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attraction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttractionModelImpl _$$AttractionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttractionModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      roadAddress: json['roadAddress'] as String?,
      lotNumberAddress: json['lotNumberAddress'] as String?,
      rating: (json['rating'] as num).toDouble(),
      categoryTypes: (json['categoryTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$PlaceCategoryTypeEnumMap, e))
          .toList(),
      visitReasons: (json['visitReasons'] as List<dynamic>)
          .map((e) =>
              AttractionVisitReasonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AttractionModelImplToJson(
        _$AttractionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'roadAddress': instance.roadAddress,
      'lotNumberAddress': instance.lotNumberAddress,
      'rating': instance.rating,
      'categoryTypes': instance.categoryTypes
          .map((e) => _$PlaceCategoryTypeEnumMap[e]!)
          .toList(),
      'visitReasons': instance.visitReasons,
    };

const _$PlaceCategoryTypeEnumMap = {
  PlaceCategoryType.nature: 'nature',
  PlaceCategoryType.tourism: 'tourism',
  PlaceCategoryType.culture: 'culture',
  PlaceCategoryType.commerce: 'commerce',
  PlaceCategoryType.transport: 'transport',
  PlaceCategoryType.dining: 'dining',
  PlaceCategoryType.lodging: 'lodging',
};

_$AttractionVisitReasonModelImpl _$$AttractionVisitReasonModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttractionVisitReasonModelImpl(
      reasonType:
          $enumDecode(_$TravelVisitReasonTypeEnumMap, json['reasonType']),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$AttractionVisitReasonModelImplToJson(
        _$AttractionVisitReasonModelImpl instance) =>
    <String, dynamic>{
      'reasonType': _$TravelVisitReasonTypeEnumMap[instance.reasonType]!,
      'count': instance.count,
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
