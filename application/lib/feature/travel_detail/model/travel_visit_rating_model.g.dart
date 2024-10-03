// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_visit_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
