import 'dart:convert';

import 'package:application_new/domain/geo_json/geo_json_repository.dart';
import 'package:application_new/shared/dto/types.dart';
import 'package:flutter/services.dart';

import 'geo_json_model.dart';

final class AssetGeoJsonRepository implements GeoJsonRepository {
  static Json? _metadata;

  static List<GeoJsonModel>? _assets;

  @override
  Future<GeoJsonModel> findById(int provinceId) async {
    if (_assets == null) {
      await _loadAssets();
    }

    return _assets!.where((province) => province.id == provinceId).first;
  }

  Future<void> _loadAssets() async {
    await _loadMetaData();

    if (_assets != null) return;
    final futures = List.of(_metadata!['assets']).map((asset) async =>
        GeoJsonModel(
            id: asset['id'], geoJson: await _loadJson(asset)));

    _assets = await Future.wait(futures);
  }

  Future<void> _loadMetaData() async {
    if (_metadata != null) return;

    _metadata = jsonDecode(
        await rootBundle.loadString('assets/geo_jsons/metadata.json'));
  }

  Future<Json> _loadJson(Json asset) async {
    final jsonString =
        await rootBundle.loadString('assets/geo_jsons/${asset['path']}');
    return jsonDecode(jsonString);
  }
}
