import 'package:application_new/feature/travel_read/model/travel_visit_model.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_detail_model.freezed.dart';
part 'travel_detail_model.g.dart';

@freezed
class TravelDetailModel with _$TravelDetailModel {
  const TravelDetailModel._();

  const factory TravelDetailModel(
      {required TravelModel travel,
      required List<TravelVisitModel> visits,
      required List<PlaceModel> places}) = _TravelDetailModel;

  factory TravelDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TravelDetailModelFromJson(json);
}
