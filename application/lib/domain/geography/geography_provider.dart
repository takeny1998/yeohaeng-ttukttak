import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geography_provider.g.dart';

@Riverpod(keepAlive: true)
Future<(List<CityModel>, List<RegionModel>)> geography(
    GeographyRef ref) async {
  final response = await ref
      .watch(httpServiceProvider)
      .request('GET', '/api/v2/geographies');

  return (
    GeographyModel.citiesFromJson(response),
    GeographyModel.regionsFromJson(response)
  );
}

@riverpod
CityModel? city(CityRef ref, int id) {
  final geography = ref.watch(geographyProvider).value;
  if (geography == null) return null;

  final (cities, _) = geography;
  return IterableUtil.firstWhereOrNull(cities, (city) => city.id == id);
}

@riverpod
RegionModel? region(RegionRef ref, int id) {
  final geography = ref.watch(geographyProvider).value;
  if (geography == null) return null;

  final (_, regions) = geography;
  return IterableUtil.firstWhereOrNull(regions, (region) => region.id == id);
}