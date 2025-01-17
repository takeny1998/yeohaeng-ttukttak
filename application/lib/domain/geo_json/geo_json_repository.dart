import 'package:application_new/domain/geo_json/geo_json_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'asset_geo_json_repository.dart';

part 'geo_json_repository.g.dart';

abstract interface class GeoJsonRepository {
  Future<GeoJsonModel> findById(int id);
}

@riverpod
GeoJsonRepository geoJsonRepository(GeoJsonRepositoryRef ref) {
  return AssetGeoJsonRepository();
}
