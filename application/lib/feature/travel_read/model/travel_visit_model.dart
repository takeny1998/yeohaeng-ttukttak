import 'package:application_new/feature/travel_read/model/travel_visit_rating_model.dart';
import 'package:application_new/feature/travel_read/model/travel_visit_reason.dart';
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
    required TravelVisitReason reason,
    required List<ImageModel> images,
  }) = _TravelVisitModel;

  factory TravelVisitModel.fromJson(Map<String, dynamic> json) =>
      _$TravelVisitModelFromJson(json);
}
