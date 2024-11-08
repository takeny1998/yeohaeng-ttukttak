import 'dart:async';

import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/util/list_utils.dart';
import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/place_recommend_model.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'travel_plan_recommend_state.dart';

part 'travel_plan_recommend_provider.g.dart';

@riverpod
class TravelPlanRecommend extends _$TravelPlanRecommend {
  late CityModel _city;

  late List<TravelMotivationType> _motivationTypes;
  late List<TravelCompanionType> _companionTypes;

  late Set<RecommendTarget> _targets;

  static const pageSize = 3;

  @override
  TravelPlanRecommendState build(int travelId, int cityIndex) {
    final planState = ref.read(travelPlanProvider(travelId));
    _city = planState.detail.travel.cities[cityIndex];

    _initTargets(planState.detail.travel);
    return const TravelPlanRecommendState();
  }

  void _initTargets(TravelModel travel) {
    _motivationTypes = travel.motivationTypes;
    _companionTypes =
        travel.companions.map((companion) => companion.type).toList();

    _targets = {
      for (final categoryType in PlaceCategoryType.values)
        PlaceRecommendTarget(categoryType: categoryType)
    };
  }

  Future<void> fetch() async {
    final target = ListUtils.random(_targets);
    _targets.remove(target);

    final (curtItem, hasNextPage) = await switch (target) {
      (PlaceRecommendTarget target) => _fetchPlaces(target),
    };

    if (hasNextPage) {
      _targets.add(target.nextPage());
    }

    final placeRecommends = state.placeRecommends;
    final prevItem = placeRecommends.lastOrNull;

    if (prevItem != null && prevItem.categoryType == curtItem.categoryType) {
      state = state.copyWith(placeRecommends: [
        for (int i = 0; i < placeRecommends.length; i++)
          if (i == placeRecommends.length - 1)
            prevItem.copyWith(places: [...prevItem.places, ...curtItem.places])
          else
            placeRecommends[i]
      ]);
      return;
    }

    state = state.copyWith(
        placeRecommends: [...placeRecommends, curtItem],
        hasNextPage: _targets.isNotEmpty);
  }

  Future<(PlaceRecommendModel, bool)> _fetchPlaces(
      PlaceRecommendTarget target) async {
    final httpService = ref.read(httpServiceProvider);
    final categoryType = target.categoryType;

    final queryParams = {
      'cityId': '${_city.id}',
      'categoryType': categoryType.name,
      'pageSize': pageSize,
      'pageNumber': target.pageNumber,
      'motivationTypes': _motivationTypes.map((e) => e.name).join(','),
      'companionTypes': _companionTypes.map((e) => e.name).join(','),
    };

    final response = await httpService.request(
        'GET', '/api/v2/places/recommendations',
        queryParams: queryParams);

    final hasNext = response['hasNextPage'] as bool;

    return (PlaceRecommendModel.fromJson(categoryType, response), hasNext);
  }
}
