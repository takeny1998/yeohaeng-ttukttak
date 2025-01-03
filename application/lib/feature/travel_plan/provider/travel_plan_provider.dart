import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_state.dart';
import 'package:application_new/domain/travel/travel_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_plan_provider.g.dart';

@riverpod
class TravelPlan extends _$TravelPlan {

  @override
  FutureOr<TravelPlanState> build(int travelId) async {
    final travel = await ref.watch(travelProvider(travelId).future);

    final cities = await _fetchCities(travelId);

    return TravelPlanState(travel: travel, cities: cities, selectedCity: cities.first);
  }

  Future<List<CityModel>> _fetchCities(int travelId) async {

    final response = await ref.read(httpServiceProvider).get('/travels/$travelId/cities');
    return List.of(response['cities']).map((json) => CityModel.fromJson(json)).toList();

  }

  void changePage(int pageIndex) {
    final prevState = state.value;
    if (prevState == null || !IterableUtil.isIndexInRange(pageIndex, end: 4)) return;

    state = AsyncValue.data(prevState.copyWith(pageIndex: pageIndex));
  }

  void selectCity(CityModel city) {
    final prevState = state.value;
    if (prevState == null) return;

    state = AsyncValue.data(prevState.copyWith(selectedCity: city));

  }

}
