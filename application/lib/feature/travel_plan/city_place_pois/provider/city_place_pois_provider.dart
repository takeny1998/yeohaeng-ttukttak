import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_place_pois_provider.g.dart';

@riverpod
class CityPlacePois extends _$CityPlacePois {
  late final int _cityId;
  late final PlaceSortType _sortType;

  int _pageNumber = 0;
  final int _pageSize = 10;

  @override
  CityPlacePoisState build(int cityId, PlaceSortType sortType) {
    _cityId = cityId;
    _sortType = sortType;

    return const CityPlacePoisState();
  }

  void fetch() async {
    final httpService = ref.read(httpServiceProvider);

    final Map<String, dynamic> queryParams = {
      'cityId': _cityId,
      'pageNumber': _pageNumber,
      'pageSize': _pageSize,
      'sortType': _sortType.name,
    };

    final response = await httpService.request('GET', '/api/v2/places/pois',
        queryParams: queryParams);

    final placeMetrics = List.of(response['places'])
        .map((e) => PlaceMetricModel.fromJson(e))
        .toList();

    state = state.copyWith(
      placeMetrics: [...state.placeMetrics, ...placeMetrics],
      hasNextPage: response['hasNextPage'],
    );

    _pageNumber++;
  }
}
