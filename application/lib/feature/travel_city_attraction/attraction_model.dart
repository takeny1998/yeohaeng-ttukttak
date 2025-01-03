import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attraction_model.freezed.dart';
part 'attraction_model.g.dart';


@freezed
class AttractionModel with _$AttractionModel {

  const factory AttractionModel({
    required int id,
    required String name,
    required String? roadAddress,
    required String? lotNumberAddress,
    required double rating,
    required List<PlaceCategoryType> categoryTypes,
    required List<AttractionVisitReasonModel> visitReasons,
  }) = _AttractionModel;


  factory AttractionModel.fromJson(Map<String, dynamic> json) =>
        _$AttractionModelFromJson(json);

}

@freezed
class AttractionVisitReasonModel with _$AttractionVisitReasonModel {

  const factory AttractionVisitReasonModel({
    required TravelVisitReasonType reasonType,
    required int count,
  }) = _AttractionVisitReasonModel;

  factory AttractionVisitReasonModel.fromJson(Map<String, dynamic> json) =>
      _$AttractionVisitReasonModelFromJson(json);
}