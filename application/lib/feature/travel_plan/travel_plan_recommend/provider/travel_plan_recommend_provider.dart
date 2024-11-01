import 'dart:async';
import 'dart:math';

import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/util/list_utils.dart';
import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/recommend_model.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'travel_plan_recommend_state.dart';

part 'travel_plan_recommend_provider.g.dart';

@riverpod
class TravelPlanRecommend extends _$TravelPlanRecommend {
  late CityModel _city;
  late Set<PlaceTarget> _placeTargets;
  late TravelTarget _travelTarget;

  @override
  TravelPlanRecommendState build(int travelId, int cityIndex) {
    final planState = ref.read(travelPlanProvider(travelId));
    _city = planState.detail.travel.cities[cityIndex];

    _initTargets(planState.detail.travel);
    return const TravelPlanRecommendState();
  }

  void _initTargets(TravelModel travel) {
    _placeTargets = {
      for (final category in PlaceCategory.getRecommendable()) ...[
        for (final motivation in travel.motivations)
          MotivationTarget(motivation: motivation, category: category),
        CompanionTypeTarget(
            companionType: travel.companionType, category: category),
      ],
      for (final category in PlaceCategory.getPopularity()) ...[
        PopularityTarget(category: category)
      ]
    };

    _travelTarget = TravelTarget(
        motivations: travel.motivations,
        companionTypes: [travel.companionType]);
  }

  Future<RecommendModel> _fetchPlace() async {
    final target = ListUtils.random(_placeTargets);
    _placeTargets.remove(target);

    final recommend = await _fetch(target);

    if (recommend.hasNextPage) {
      _placeTargets.add(target.nextPage());
    }

    return recommend;
  }

  Future<RecommendModel> _fetchTravel() async {
    final httpService = ref.read(httpServiceProvider);

    final Map<String, dynamic> queryParams = {
      'cityId': _city.id,
      'pageNumber': _travelTarget.pageNumber,
      'pageSize': 5,
      'motivations': _travelTarget.motivations.map((e) => e.name).join(','),
      'companionTypes': _travelTarget.companionTypes.map((e) => e.name).join(',')
    };

    print(queryParams);

    final response = await httpService.request(
        'GET', '/api/v2/travels/recommendations',
        queryParams: queryParams);

    final recommendModel = RecommendTravelModel(
        hasNextPage: response['hasNextPage'],
        travels: List.of(response['travels'])
            .map((travel) => TravelModel.fromJson(travel))
            .toList());

    if (recommendModel.hasNextPage) {
      _travelTarget = _travelTarget.nextPage();
    } else {
      state = state.copyWith(hasMoreTravel: false);
    }

    return recommendModel;
  }

  Future<void> random() async {
    final isTravelPicked =
        state.hasMoreTravel ? Random().nextInt(3) == 2 : false;

    final recommend = await switch (isTravelPicked) {
      true => _fetchTravel(),
      false => _fetchPlace(),
    };

    state = state.copyWith(
        recommendations: [...state.recommendations, recommend],
        hasNextPage: _placeTargets.isNotEmpty);
  }

  Future<RecommendModel> _fetch(
    PlaceTarget target,
  ) async {
    final httpService = ref.read(httpServiceProvider);

    final category = target.category;

    final queryParams = {
      'cityId': '${_city.id}',
      'category': category.name,
      'pageSize': 5,
      'pageNumber': target.pageNumber
    };

    String uri = '/api/v2/places/recommendations';

    switch (target) {
      case MotivationTarget(:final motivation):
        queryParams['motivation'] = motivation.name;
      case CompanionTypeTarget(:final companionType):
        queryParams['companionType'] = companionType.name;
      case PopularityTarget():
        uri = '/api/v2/places/popularity';
    }

    final response =
        await httpService.request('GET', uri, queryParams: queryParams);

    final places = List.of(response['places'])
        .map((json) => PlaceModel.fromJson(json))
        .toList();

    return RecommendPlaceModel(
        target: target,
        category: category,
        places: places,
        hasNextPage: response['hasNextPage']);
  }
}
