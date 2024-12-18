import 'package:application_new/domain/geography/geo_json_model.dart';
import 'package:application_new/domain/geography/memory_geo_json_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geo_json_repository.g.dart';

abstract interface class GeoJsonRepository {
  Future<List<GeoJsonModel>> load();
}

@riverpod
GeoJsonRepository geoJsonRepository(GeoJsonRepositoryRef ref) {
  return MemoryGeoJsonRepository();
}
