import 'package:application_new/shared/model/image_model.dart';
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
    DateTime? visitedOn,
    int? orderOfVisit,
    TravelVisitReasonType? reasonType,
  }) = _TravelVisitModel;

  factory TravelVisitModel.fromJson(Map<String, dynamic> json) =>
      _$TravelVisitModelFromJson(json);
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
  }) = _TravelVisitForm;

  factory TravelVisitForm.fromJson(Map<String, dynamic> json) =>
      _$TravelVisitFormFromJson(json);
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
