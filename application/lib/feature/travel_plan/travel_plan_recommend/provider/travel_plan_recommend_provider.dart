import 'dart:async';
import 'dart:math';

import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/common/util/list_utils.dart';
import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/geography/provider/geography_provider.dart';
import 'package:application_new/feature/travel_plan/component/travel_city_item.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/recommend_model.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:application_new/shared/provider/travel_detail_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'travel_plan_recommend_state.dart';

part 'travel_plan_recommend_provider.g.dart';

@riverpod
class TravelPlanRecommend extends _$TravelPlanRecommend {
  late CityModel _city;
  late List<RecommendTarget> _targets;

  @override
  TravelPlanRecommendState build(int travelId, int cityIndex) {
    final planState = ref.read(travelPlanProvider(travelId));
    _city = planState.detail.travel.cities[cityIndex];

    _initTargets(planState.detail.travel);
    return const TravelPlanRecommendState();
  }

  void _initTargets(TravelModel travel) {
    _targets = [
      for (final motivation in travel.motivations)
        MotivationTarget(motivation: motivation),
      CompanionTypeTarget(companionType: travel.companionType),
    ];
  }

  Future<void> random() async {
    final category = ListUtils.random(PlaceCategory.getRecommendable());
    final target = ListUtils.random(_targets);

    final recommend = await _fetch(category: category, target: target);

    state =
        state.copyWith(recommendations: [...state.recommendations, recommend]);
  }

  Future<RecommendModel> _fetch({
    required PlaceCategory category,
    required RecommendTarget target,
  }) async {
    final httpService = ref.watch(httpServiceProvider);

    final queryParams = {
      'cityId': '${_city.id}',
      'category': category.name,
    };

    switch (target) {
      case MotivationTarget(:final motivation):
        queryParams['motivation'] = motivation.name;
      case CompanionTypeTarget(:final companionType):
        queryParams['companionType'] = companionType.name;
    }

    final response = await httpService.request(
        'GET', '/api/v2/places/recommendations',
        queryParams: queryParams);

    final places = List.of(response['places'])
        .map((json) => PlaceModel.fromJson(json))
        .toList();

    return RecommendModel(target: target, category: category, places: places);
  }
}
