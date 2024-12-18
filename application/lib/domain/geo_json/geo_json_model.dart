import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_json_model.freezed.dart';

@freezed
class GeoJsonModel with _$GeoJsonModel {

  const GeoJsonModel._();

  const factory GeoJsonModel.country({
    required Map<String, dynamic> geoJson,
  }) = GeoJsonCountryModel;

  const factory GeoJsonModel.province({
    required int id,
    required Map<String, dynamic> geoJson,
  }) = GeoJsonProvinceModel;
}