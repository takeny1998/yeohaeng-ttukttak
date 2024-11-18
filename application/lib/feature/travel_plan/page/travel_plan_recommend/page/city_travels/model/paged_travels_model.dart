import 'package:application_new/domain/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_travels_model.freezed.dart';
part 'paged_travels_model.g.dart';

@freezed
class PagedTravelsModel with _$PagedTravelsModel {
  const PagedTravelsModel._();

  const factory PagedTravelsModel({
    @Default([]) List<TravelModel> travels,
    @Default(false) hasNextPage,
  }) = _PagedTravelsModel;

  factory PagedTravelsModel.fromJson(Map<String, dynamic> json) =>
      _$PagedTravelsModelFromJson(json);
}
