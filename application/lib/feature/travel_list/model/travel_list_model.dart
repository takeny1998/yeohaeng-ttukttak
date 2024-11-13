import 'package:application_new/domain/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_list_model.freezed.dart';
part 'travel_list_model.g.dart';

@freezed
class TravelListModel with _$TravelListModel {
  const factory TravelListModel({
    @Default([]) List<TravelModel> travels,
  }) = _TravelListModel;

  factory TravelListModel.fromJson(Map<String, dynamic> json) =>
      _$TravelListModelFromJson(json);
}
