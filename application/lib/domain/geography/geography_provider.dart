import 'package:application_new/common/http/http_service_provider.dart';

import 'package:application_new/domain/geography/geography_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geography_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<GeographyModel>> geographies(GeographiesRef ref) async {
  final response = await ref.watch(httpServiceProvider).get('/geographies');

  return GeographyModel.listFromJson(response);
}

@riverpod
Future<GeographyModel> geography(GeographyRef ref, int id) async {
  final geographies = await ref.watch(geographiesProvider.future);
  return geographies.where((e) => e.id == id).first;
}

@riverpod
Future<CityModel> city(CityRef ref, int id) async {
  final geographies = await ref.watch(geographiesProvider.future);

  return geographies
      .whereType<CityModel>()
      .where((e) => e.id == id)
      .first;
}

@riverpod
Future<ProvinceModel> province(ProvinceRef ref, int id) async {
  final geographies = await ref.watch(geographiesProvider.future);

  return geographies
      .whereType<ProvinceModel>()
      .where((e) => e.id == id)
      .first;
}
