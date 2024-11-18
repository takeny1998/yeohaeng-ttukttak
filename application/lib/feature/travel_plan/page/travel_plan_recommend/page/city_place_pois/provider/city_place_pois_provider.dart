import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'city_place_pois_state.dart';

part 'city_place_pois_provider.g.dart';

@riverpod
class CityPlacePois extends _$CityPlacePois {

  int _pageNumber = 0;
  final int _pageSize = 5;

  @override
  CityPlacePoisState? build(int travelId, int cityId, PlaceSortType sortType) {

    final travel = ref.watch(travelProvider(travelId)).value;
    final city =  ref.watch(cityProvider(cityId));
    if (city == null || travel == null) return null;

    fetch();

    return CityPlacePoisState(travel: travel, city: city);
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
