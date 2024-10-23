import 'dart:async';
import 'dart:math';

import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/util/list_utils.dart';
import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/recommend_model.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/provider/travel_detail_provider.dart';
import 'travel_plan_recommend_state.dart';

part 'travel_plan_recommend_provider.g.dart';

@riverpod
class TravelPlanRecommend extends _$TravelPlanRecommend {

  late final CityModel _city;
  late final List<RecommendTarget> _targets;

  @override
  TravelPlanRecommendState build(int travelId, CityModel city) {
    final travel = ref.watch(travelDetailProvider(travelId)).travel;

    _city = city;
    _targets = [
      for (final motivation in travel.motivations)
        MotivationTarget(motivation: motivation),
      CompanionTypeTarget(companionType: travel.companionType),
    ];

    final link = ref.keepAlive();
    final timer = Timer(const Duration(minutes: 5), link.close);

    ref.onDispose(timer.cancel);

    for (int i = 0; i < 5; i++) {
      random();
    }

    return const TravelPlanRecommendState();
  }

  void random() async {
    final httpService = ref.watch(httpServiceProvider);

    final category = ListUtils.random(PlaceCategory.getRecommendable());
    final queryParams = {'cityId': '${_city.id}', 'category': category.name};

    final target = ListUtils.random(_targets);

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

    state = state.copyWith(recommendations: [
      ...state.recommendations,
      RecommendModel(target: target, category: category, places: places),
    ]);
  }
}
