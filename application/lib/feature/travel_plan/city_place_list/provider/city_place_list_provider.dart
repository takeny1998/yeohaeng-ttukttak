import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_list/provider/city_place_list_state.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_place_list_provider.g.dart';

@riverpod
class CityPlaceList extends _$CityPlaceList {
  late final int _cityId;
  late final PlaceCategoryType _categoryType;

  int _pageNumber = 0;
  final int _pageSize = 10;

  @override
  CityPlaceListState build(int cityId, PlaceCategoryType categoryType) {
    _cityId = cityId;
    _categoryType = categoryType;

    return const CityPlaceListState();
  }

  void fetch() async {
    final httpService = ref.read(httpServiceProvider);

    final Map<String, dynamic> queryParams = {
      'cityId': _cityId,
      'categoryType': _categoryType.name,
      'pageNumber': _pageNumber,
      'pageSize': _pageSize,
      'sortType': state.sortType.name,
    };

    final response = await httpService.request('GET', '/api/v2/places',
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
