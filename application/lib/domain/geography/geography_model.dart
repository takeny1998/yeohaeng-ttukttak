import 'package:application_new/shared/model/image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geography_model.freezed.dart';
part 'geography_model.g.dart';

@freezed
sealed class GeographyModel with _$GeographyModel {
  const factory GeographyModel.city({
    required int id,
    required String name,
    required int regionId,
    required ImageModel insignia,
  }) = CityModel;

  const factory GeographyModel.region({
    required int id,
    required String name,
    required String shortName,
    required ImageModel insignia,
  }) = RegionModel;

  factory GeographyModel.fromJson(Map<String, dynamic> json) =>
      _$GeographyModelFromJson(json);

  static List<CityModel> citiesFromJson(Map<String, dynamic> json) {
    return List.of(json['cities'])
        .map((json) => CityModel.fromJson(json))
        .toList();
  }

  static List<RegionModel> regionsFromJson(Map<String, dynamic> json) {
    return List.of(json['regions'])
        .map((json) => RegionModel.fromJson(json))
        .toList();
  }
}
