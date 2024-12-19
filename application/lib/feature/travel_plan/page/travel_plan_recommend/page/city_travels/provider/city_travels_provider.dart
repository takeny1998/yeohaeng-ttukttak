import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_travels/model/paged_travels_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_travels/provider/city_travels_state.dart';
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
    final city = ref.watch(cityProvider(cityId)).value;

    if (travel == null || city == null) return null;

    _motivationTypes = travel.motivationTypes.toSet();
    _companionTypes = travel.companionTypes.toSet();
    fetch();

    return CityTravelsState(city: city);
  }

  void fetch() async {
    final pagedTravels = await _fetch();
    state = state?.mergeWith(pagedTravels);

    _pageNumber++;
  }

  Future<PagedTravelsModel> _fetch() async {
    final httpService = ref.read(httpServiceProvider);

    final response = await httpService.get('/travels/recommendations',
        options: ServerRequestOptions(queryParameters: {
          'cityId': cityId,
          'pageNumber': _pageNumber,
          'pageSize': _pageSize,
          'motivationTypes': _motivationTypes.map((e) => e.name).join(','),
          'companionTypes': _companionTypes.map((e) => e.name).join(','),
        }));

    return PagedTravelsModel.fromJson(response);
  }
}
