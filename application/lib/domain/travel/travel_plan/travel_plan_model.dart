import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_plan_model.freezed.dart';
part 'travel_plan_model.g.dart';

@freezed
class TravelPlanModel with _$TravelPlanModel {
  const factory TravelPlanModel({
    required int id,
    required int orderOfPlan,
    required int placeId,
    required DateTime willVisitOn,
  }) = _TravelPlanModel;

  factory TravelPlanModel.fromJson(Map<String, dynamic> json) =>
      _$TravelPlanModelFromJson(json);

  static List<TravelPlanModel> listFromJson(Map<String, dynamic> json) {
    return List.of(json['plans'])
        .map((e) => TravelPlanModel.fromJson(e))
        .toList();
  }
}
