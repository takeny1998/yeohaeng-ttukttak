import 'package:application_new/feature/travel_detail/model/travel_visit_reason.dart';
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
    required TravelVisitReason reason
  }) = _TravelVisitModel;

  factory TravelVisitModel.fromJson(Map<String, dynamic> json) =>
      _$TravelVisitModelFromJson(json);
}
