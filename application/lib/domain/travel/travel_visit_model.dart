import 'package:application_new/shared/model/image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_visit_model.freezed.dart';
part 'travel_visit_model.g.dart';

@freezed
class TravelVisitModel with _$TravelVisitModel {
  const factory TravelVisitModel({
    required int id,
    required int seq,
    required int placeId,
    required DateTime visitedOn,
    required TravelVisitRatingModel rating,
    required TravelVisitReasonType reasonType,
    required List<ImageModel> images,
  }) = _TravelVisitModel;

  factory TravelVisitModel.fromJson(Map<String, dynamic> json) =>
      _$TravelVisitModelFromJson(json);
}

@freezed
class TravelVisitRatingModel with _$TravelVisitRatingModel {
  const factory TravelVisitRatingModel({
    required int satisfaction,
    required int revisit,
    required int recommend,
  }) = _TravelVisitRatingModel;

  factory TravelVisitRatingModel.fromJson(Map<String, dynamic> json) =>
      _$TravelVisitRatingModelFromJson(json);
}

enum TravelVisitReasonType {
  landmark,
  goodReviews,
  media,
  goodExperience,
  recommendation,
  easyAccess,
  goodAmenities,
  goodValue,
  unexpectedFind,
  education,
  other
}
