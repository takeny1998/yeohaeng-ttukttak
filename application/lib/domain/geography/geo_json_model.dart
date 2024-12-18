import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_json_model.freezed.dart';

@freezed
class GeoJsonModel with _$GeoJsonModel {

  const factory GeoJsonModel({
    required int id,
    required Map<String, dynamic> geoJson,
  }) = _GeoJsonModel;

}
