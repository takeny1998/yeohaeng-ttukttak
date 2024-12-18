import 'dart:convert';

import 'package:application_new/domain/geo_json/geo_json_repository.dart';
import 'package:application_new/shared/dto/types.dart';
import 'package:flutter/services.dart';

import 'geo_json_model.dart';

final class AssetGeoJsonRepository implements GeoJsonRepository {
  static Json? _metadata;

  static GeoJsonCountryModel? _country;
  static List<GeoJsonProvinceModel>? _provinces;

  @override
  Future<GeoJsonProvinceModel> findProvinceById(int provinceId) async {
    Future<void> loadProvinces() async {
      await _loadMetaData();

      if (_provinces != null) return;
      final futures = List.of(_metadata!['states']).map((asset) async =>
          GeoJsonProvinceModel(
              id: asset['id'], geoJson: await _loadJson(asset)));

      _provinces = await Future.wait(futures);
    }

    if (_provinces == null) {
      await loadProvinces();
    }

    return _provinces!.where((province) => province.id == provinceId).first;
  }

  @override
  Future<GeoJsonCountryModel> getCountry() async {
    Future<void> loadCountry() async {
      await _loadMetaData();

      if (_country != null) return;
      final asset = List.of(_metadata!['countries']).first;

      _country = GeoJsonCountryModel(geoJson: await _loadJson(asset));
    }

    if (_country == null) {
      await loadCountry();
    }

    return _country!;
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
