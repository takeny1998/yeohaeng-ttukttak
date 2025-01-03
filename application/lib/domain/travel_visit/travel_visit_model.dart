import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/shared/model/image_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_visit_model.freezed.dart';
part 'travel_visit_model.g.dart';

@freezed
class TravelVisitModel with _$TravelVisitModel {
  const factory TravelVisitModel({
    required int id,
    required int placeId,
    required TravelVisitRatingModel rating,
    required List<ImageModel> images,
    required DateTime visitedOn,
    required int orderOfVisit,
    TravelVisitReasonType? reasonType,
  }) = _TravelVisitModel;

  factory TravelVisitModel.fromJson(Map<String, dynamic> json) =>
      _$TravelVisitModelFromJson(json);

  static List<TravelVisitModel> listFromJson(Map<String, dynamic> json) =>
      List.of(json['visits'])
          .map((travel) => TravelVisitModel.fromJson(travel))
          .toList();
}

@freezed
class TravelVisitWithPlaceModel with _$TravelVisitWithPlaceModel {
  const factory TravelVisitWithPlaceModel({
    required TravelVisitModel visit,
    required PlaceModel place,
  }) = _TravelVisitWithPlaceModel;
}

@freezed
class TravelVisitRatingModel with _$TravelVisitRatingModel {
  const factory TravelVisitRatingModel({
    int? satisfaction,
    int? revisit,
    int? recommend,
  }) = _TravelVisitRatingModel;

  factory TravelVisitRatingModel.fromJson(Map<String, dynamic> json) =>
      _$TravelVisitRatingModelFromJson(json);
}

@freezed
class TravelVisitForm with _$TravelVisitForm {
  const factory TravelVisitForm({
    required int placeId,
    required int dayOfTravel,
  }) = _TravelVisitForm;

  factory TravelVisitForm.fromJson(Map<String, dynamic> json) =>
      _$TravelVisitFormFromJson(json);
}

@freezed
class TravelVisitEditModel with _$TravelVisitEditModel {
  const factory TravelVisitEditModel({
    required int id,
    required int orderOfVisit,
    required int dayOfTravel,
  }) = _TravelVisitPlanModel;

  factory TravelVisitEditModel.fromJson(Map<String, dynamic> json) =>
      _$TravelVisitEditModelFromJson(json);
}

enum TravelVisitReasonType {
  landmark(Icons.local_attraction, "It's a hot spot"), // 인기가 좋아요
  goodReviews(Icons.local_attraction, 'The reviews were good'), // 방문 리뷰가 좋아요
  media(Icons.local_attraction, 'The reviews were good'), // 방문 리뷰가 좋아요
  goodExperience(Icons.local_attraction, "I had good experiences"), // 좋은 경험이 있어요
  recommendation(Icons.local_attraction, 'Referred by a friend'), // 지인이 추천했어요
  easyAccess(Icons.local_attraction, "It's easy to access"), // 교통이 좋아요
  goodAmenities(Icons.local_attraction, 'It has good amenities/services'), // 시설/서비스가 좋아요
  goodValue(Icons.local_attraction, "It's a good value"), // 가성비가 좋아요
  unexpectedFind(Icons.local_attraction, 'I found it by chance'), // 우연히 발견했어요
  education(Icons.local_attraction, "It's an educational place"), // 교육성이 좋은 장소에요
  other(Icons.local_attraction, 'Other'); // 기타

  final String shortLabel;
  final IconData iconData;

  const TravelVisitReasonType(this.iconData, this.shortLabel);
}
