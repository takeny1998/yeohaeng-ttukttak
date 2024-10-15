import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_detail/model/travel_visit_model.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:application_new/shared/model/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_detail_model.freezed.dart';
part 'travel_detail_model.g.dart';

@freezed
class TravelDetailModel with _$TravelDetailModel {
  const TravelDetailModel._();

  const factory TravelDetailModel(
      {required TravelModel travel,
      @Default([]) List<TravelVisitModel> visits,
      @Default([]) List<PlaceModel> places}) = _TravelDetailModel;

  factory TravelDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TravelDetailModelFromJson(json);

  factory TravelDetailModel.empty() =>
      TravelDetailModel(travel: TravelModel.empty());
}
