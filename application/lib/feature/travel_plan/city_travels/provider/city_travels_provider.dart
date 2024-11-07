import 'package:application_new/feature/travel_plan/city_travels/model/paged_travels_model.dart';
import 'package:application_new/feature/travel_plan/city_travels/provider/city_travels_state.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:application_new/common/http/http_service_provider.dart';

part 'city_travels_provider.g.dart';

@riverpod
class CityTravels extends _$CityTravels {
  late final int _cityId;

  late final Set<TravelMotivationType> _motivationTypes;
  late final Set<TravelCompanionType> _companionTypes;

  int _pageNumber = 0;
  final int _pageSize = 3;

  @override
  CityTravelsState build(TravelModel travel, int cityId) {
    _cityId = cityId;

    _motivationTypes = travel.motivationTypes.toSet();
    _companionTypes =
        travel.companions.map((companion) => companion.type).toSet();

    fetch();

    return const CityTravelsState(pagedTravels: PagedTravelsModel());
  }

  void fetch() async {
    final pagedTravels = await _fetch();

    state = state.copyWith(
        pagedTravels: state.pagedTravels.mergeWith(pagedTravels));

    _pageNumber ++;
  }

  Future<PagedTravelsModel> _fetch() async {
    final httpService = ref.read(httpServiceProvider);

    final Map<String, dynamic> queryParams = {
      'cityId': _cityId,
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
