import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_list/provider/city_place_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_place_list_provider.g.dart';

@riverpod
class CityPlaceList extends _$CityPlaceList {
  late final int _cityId;

  int _pageNumber = 0;
  final int _pageSize = 10;

  @override
  CityPlaceListState build(int cityId) {
    _cityId = cityId;

    return const CityPlaceListState();
  }

  void fetch() async {
    final httpService = ref.read(httpServiceProvider);

    final Map<String, dynamic> queryParams = {
      'cityId': _cityId,
      'pageNumber': _pageNumber,
      'pageSize': _pageSize,
      'sortType': state.sortType.name,
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

  void selectViewType(PlaceViewType viewType) {
    if (state.viewType == viewType) return;

    state = state.copyWith(viewType: viewType);

  }
}
