import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'city_place_pois_state.dart';

part 'city_place_pois_provider.g.dart';

@riverpod
class CityPlacePois extends _$CityPlacePois {
  int _pageNumber = 0;
  final int _pageSize = 5;

  List<PlaceMetricModel> _placeMetrics = [];

  @override
  CityPlacePoisState? build(int travelId, int cityId, PlaceSortType sortType) {
    final travel = ref.watch(travelProvider(travelId)).value;
    final city = ref.watch(cityProvider(cityId));

    if (city == null || travel == null) return null;

    fetch();

    return CityPlacePoisState(travel: travel, city: city);
  }

  void fetch() async {
    final (placeMetrics, hasNextPage) = await _fetch();

    _placeMetrics = [..._placeMetrics, ...placeMetrics];

    state = state?.copyWith(
      placeMetrics: _filter(state!.selectedTypes),
      hasNextPage: hasNextPage,
    );

    _pageNumber++;
  }

  void selectCategoryType(PlaceCategoryType categoryType) {
    if (state == null) return;

    final selectedTypes = Set.of(state!.selectedTypes);
    final isSelected = selectedTypes.contains(categoryType);

    if (isSelected) {
      selectedTypes.remove(categoryType);
    } else {
      selectedTypes.add(categoryType);
    }

    state = state!.copyWith(
      placeMetrics: _filter(selectedTypes),
      selectedTypes: selectedTypes,
    );
  }

  void deleteCategoryType(PlaceCategoryType categoryType) {
    if (state == null) return;

    final selectedTypes = Set.of(state!.selectedTypes);
    final isSelected = selectedTypes.contains(categoryType);

    if (!isSelected) return;
    selectedTypes.remove(categoryType);

    state = state!.copyWith(
      placeMetrics: _filter(selectedTypes),
      selectedTypes: selectedTypes,
    );
  }

  void clearCategoryTypes() {
    if (state == null) return;

    state = state!.copyWith(
      placeMetrics: _filter({}),
      selectedTypes: {},
    );
  }

  Future<(List<PlaceMetricModel>, bool)> _fetch() async {
    final httpService = ref.read(httpServiceProvider);

    final response = await httpService.get('/places/pois',
        options: ServerRequestOptions(queryParameters: {
          'cityId': cityId,
          'pageNumber': _pageNumber,
          'pageSize': _pageSize,
          'sortType': sortType.name,
        }));

    final placeMetrics = List.of(response['places'])
        .map((e) => PlaceMetricModel.fromJson(e))
        .toList();

    final hasNextPage = response['hasNextPage'] as bool;

    return (placeMetrics, hasNextPage);
  }

  List<PlaceMetricModel> _filter(Set<PlaceCategoryType> selectedTypes) {
    return selectedTypes.isNotEmpty
        ? _placeMetrics
            .where((placeMetric) => selectedTypes
                .intersection(placeMetric.place.categoryTypes.toSet())
                .isNotEmpty)
            .toList()
        : _placeMetrics;
  }
}
