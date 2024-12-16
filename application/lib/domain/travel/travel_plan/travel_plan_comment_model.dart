import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_plan_comment_model.freezed.dart';
part 'travel_plan_comment_model.g.dart';

@freezed
class TravelPlanCommentModel with _$TravelPlanCommentModel {
  const factory TravelPlanCommentModel({
    required int id,
    required String content,
    required String createdBy,
    required DateTime createdAt,
    DateTime? lastModifiedAt,
  }) = _TravelPlanCommentModel;

  factory TravelPlanCommentModel.fromJson(Map<String, dynamic> json) =>
      _$TravelPlanCommentModelFromJson(json);

  static List<TravelPlanCommentModel> listFromJson(Map<String, dynamic> json) =>
      List.of(json['comments'])
          .map((json) => TravelPlanCommentModel.fromJson(json))
          .toList();
}
