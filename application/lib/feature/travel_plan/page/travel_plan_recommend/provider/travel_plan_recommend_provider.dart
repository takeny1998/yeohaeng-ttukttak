import 'dart:async';

import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/model/place_recommend_model.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'travel_plan_recommend_state.dart';

part 'travel_plan_recommend_provider.g.dart';

@riverpod
class TravelPlanRecommend extends _$TravelPlanRecommend {

  late List<TravelMotivationType> _motivationTypes;
  late List<TravelCompanionType> _companionTypes;

  late Set<RecommendTarget> _targets;

  static const pageSize = 3;

  @override
  TravelPlanRecommendState? build(int travelId, int cityId) {
    final state = ref.watch(travelPlanProvider(travelId));
    final city = ref.watch(cityProvider(cityId)).value;

    if (state == null || city == null) return null;

    _initTargets(state.travel);

    return TravelPlanRecommendState(
        travel: state.travel,
        city: city,
        placeRecommends: [],
        hasNextPage: true,
        hasMoreTravel: true);
  }

  void _initTargets(TravelModel travel) {
    _motivationTypes = travel.motivationTypes;
    _companionTypes = travel.companionTypes;

    _targets = {
      for (final categoryType in PlaceCategoryType.values)
        PlaceRecommendTarget(categoryType: categoryType)
    };
  }

  Future<void> fetch() async {
    if (state == null) return;

    final target = IterableUtil.random(_targets);
    _targets.remove(target);

    final (curtItem, hasNextPage) = await switch (target) {
      (PlaceRecommendTarget target) => _fetchPlaces(target),
    };

    if (hasNextPage) {
      _targets.add(target.nextPage());
    }

    final placeRecommends = state!.placeRecommends;
    final prevItem = placeRecommends.lastOrNull;

    if (prevItem != null && prevItem.categoryType == curtItem.categoryType) {
      state = state!.copyWith(placeRecommends: [
        for (int i = 0; i < placeRecommends.length; i++)
          if (i == placeRecommends.length - 1)
            prevItem.copyWith(places: [...prevItem.places, ...curtItem.places])
          else
            placeRecommends[i]
      ]);
      return;
    }

    state = state!.copyWith(
        placeRecommends: [...placeRecommends, curtItem],
        hasNextPage: _targets.isNotEmpty);
  }

  Future<(PlaceRecommendModel, bool)> _fetchPlaces(
      PlaceRecommendTarget target) async {
    final httpService = ref.read(httpServiceProvider);
    final categoryType = target.categoryType;

    final response = await httpService.get('/places/recommendations',
        options: ServerRequestOptions(
          queryParameters: {
            'cityId': cityId,
            'categoryType': categoryType.name,
            'pageSize': pageSize,
            'pageNumber': target.pageNumber,
            'motivationTypes': _motivationTypes.map((e) => e.name).join(','),
            'companionTypes': _companionTypes.map((e) => e.name).join(','),
          }
        ));

    final hasNext = response['hasNextPage'] as bool;

    return (PlaceRecommendModel.fromJson(categoryType, response), hasNext);
  }
}
