import 'dart:convert';

import 'package:application_new/domain/geography/geo_json_model.dart';
import 'package:application_new/domain/geography/geo_json_repository.dart';
import 'package:flutter/services.dart';

final class MemoryGeoJsonRepository implements GeoJsonRepository {
  static List<GeoJsonModel> _geoJsons = [];

  @override
  Future<List<GeoJsonModel>> load() async {
    if (_geoJsons.isNotEmpty) {
      return _geoJsons;
    }

    print('fetch geo-json');

    final Map<String, dynamic> assets = jsonDecode(
        await rootBundle.loadString('assets/geojsons/metadata.json'));

    final futures = List.of(assets['files']).map((asset) async {
      final jsonString =
          await rootBundle.loadString('assets/geojsons/${asset['name']}');
      final geoJson = jsonDecode(jsonString) as Map<String, dynamic>;

      return GeoJsonModel(id: asset['id'], geoJson: geoJson);
    }).toList();

    _geoJsons = await Future.wait(futures);
    return _geoJsons;
  }
}
