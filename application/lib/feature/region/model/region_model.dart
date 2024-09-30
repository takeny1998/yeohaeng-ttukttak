import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_model.freezed.dart';
part 'region_model.g.dart';

@freezed
class RegionModel with _$RegionModel {
  const factory RegionModel({
    required int id,
    required String name,
    required String shortName
  }) = _RegionModel;

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);
}
