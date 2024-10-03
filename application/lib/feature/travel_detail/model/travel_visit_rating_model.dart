import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_visit_rating_model.freezed.dart';
part 'travel_visit_rating_model.g.dart';

@freezed
class TravelVisitRatingModel with _$TravelVisitRatingModel {

  const factory TravelVisitRatingModel({
    required int satisfaction,
    required int revisit,
    required int recommend
  }) = _TravelVisitRatingModel;

  factory TravelVisitRatingModel.fromJson(Map<String, dynamic> json) =>
      _$TravelVisitRatingModelFromJson(json);

}