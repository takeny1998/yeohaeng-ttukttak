import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/geography/provider/geography_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

part 'city_place_pois_provider.g.dart';

@riverpod
class CityPlacePois extends _$CityPlacePois {

  int _pageNumber = 0;
  final int _pageSize = 5;

  @override
  CityPlacePoisState? build(int cityId, PlaceSortType sortType) {

    final city = ref
        .watch(geographyProvider)
        .cities
        .firstWhereOrNull((city) => city.id == cityId);

    if (city == null) return null;

    fetch();

    return CityPlacePoisState(city: city);
  }

  void fetch() async {
    final (placeMetrics, hasNextPage) = await _fetch();

    state = state?.copyWith(
      placeMetrics: [...?state?.placeMetrics, ...placeMetrics],
      hasNextPage: hasNextPage,
    );

    _pageNumber++;
  }

  Future<(List<PlaceMetricModel>, bool)> _fetch() async {
    final httpService = ref.read(httpServiceProvider);

    final Map<String, dynamic> queryParams = {
      'cityId': cityId,
      'pageNumber': _pageNumber,
      'pageSize': _pageSize,
      'sortType': sortType.name,
    };

    final response = await httpService.request('GET', '/api/v2/places/pois',
        queryParams: queryParams);

    final placeMetrics = List.of(response['places'])
        .map((e) => PlaceMetricModel.fromJson(e))
        .toList();

    final hasNextPage = response['hasNextPage'] as bool;

    return (placeMetrics, hasNextPage);
  }
}
