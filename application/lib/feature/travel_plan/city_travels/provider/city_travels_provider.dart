import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/feature/geography/provider/geography_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/component/city_places_map.dart';
import 'package:application_new/feature/travel_plan/city_travels/model/paged_travels_model.dart';
import 'package:application_new/feature/travel_plan/city_travels/provider/city_travels_state.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:application_new/common/http/http_service_provider.dart';

part 'city_travels_provider.g.dart';

@riverpod
class CityTravels extends _$CityTravels {

  Set<TravelMotivationType> _motivationTypes = {};
  Set<TravelCompanionType> _companionTypes = {};

  int _pageNumber = 0;
  final int _pageSize = 3;

  @override
  CityTravelsState? build(int travelId, int cityId) {

    final travel = ref.watch(travelProvider(travelId)).value;

    if (travel != null) {
      _motivationTypes = travel.motivationTypes.toSet();
      _companionTypes =
          travel.companions.map((companion) => companion.type).toSet();

      fetch();
    }

    final cities = ref.watch(geographyProvider).cities;


    final city = IterableUtil.firstWhereOrNull(cities, (city) => city.id == cityId);

    if (city == null) return null;

    return CityTravelsState(city: city);
  }

  void fetch() async {
    final pagedTravels = await _fetch();


    state = state?.mergeWith(pagedTravels);

    _pageNumber++;
  }

  Future<PagedTravelsModel> _fetch() async {
    final httpService = ref.read(httpServiceProvider);

    final Map<String, dynamic> queryParams = {
      'cityId': cityId,
      'pageNumber': _pageNumber,
      'pageSize': _pageSize,
      'motivationTypes': _motivationTypes.map((e) => e.name).join(','),
      'companionTypes': _companionTypes.map((e) => e.name).join(','),
    };

    final response = await httpService.request(
      'GET',
      '/api/v2/travels/recommendations',
      queryParams: queryParams,
    );

    return PagedTravelsModel.fromJson(response);
  }
}
