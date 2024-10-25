import 'package:application_new/shared/model/place_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../provider/travel_plan_recommend_state.dart';

part 'recommend_model.freezed.dart';

@freezed
class RecommendModel with _$RecommendModel {
  const factory RecommendModel({
    required RecommendTarget target,
    required PlaceCategory category,
    required List<PlaceModel> places,
    required bool hasNextPage,
  }) = _RecommendModel;

}
