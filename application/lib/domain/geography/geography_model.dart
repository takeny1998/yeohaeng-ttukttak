import 'package:application_new/shared/model/image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geography_model.freezed.dart';
part 'geography_model.g.dart';

@Freezed(unionKey: 'level')
sealed class GeographyModel with _$GeographyModel {
  @FreezedUnionValue('0')
  const factory GeographyModel.country({
    required int id,
    required String name,
    required int parentId,
    required String shortName,
  }) = CountryModel;

  @FreezedUnionValue('1')
  const factory GeographyModel.province({
    required int id,
    required String name,
    required int parentId,
    required String shortName,
    required ImageModel insignia,
  }) = ProvinceModel;

  @FreezedUnionValue('2')
  const factory GeographyModel.city({
    required int id,
    required String name,
    required int parentId,
    required String shortName,
    required ImageModel insignia,
  }) = CityModel;

  factory GeographyModel.fromJson(Map<String, dynamic> json) =>
      _$GeographyModelFromJson(json);

  static List<GeographyModel> listFromJson(Map<String, dynamic> json) =>
      List.of(json['geographies'])
          .map((e) => GeographyModel.fromJson(e))
          .toList();
}
