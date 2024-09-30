import 'package:application_new/common/http/http_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/city_model.dart';
import '../model/geography_state.dart';
import '../model/region_model.dart';

part 'geography_provider.g.dart';

@riverpod
class Geography extends _$Geography {
  @override
  GeographyState build() {
    _init();
    return const GeographyState();
  }

  Future<void> _init() async {
    final httpService = ref.read(httpServiceProvider);

    final response = await httpService.request('GET', '/api/v2/geographies');

    final regions = List.from(response['regions'])
        .map((e) => RegionModel.fromJson(e))
        .toList();

    final cities = List.from(response['cities'])
        .map((e) => CityModel.fromJson(e))
        .toList();

    state = state.copyWith(
      regions: regions,
      cities: cities,
    );
  }
}