import 'dart:async';
import 'package:application_new/feature/travel_plan/component/travel_city_item.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/component/recommend_item.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/provider/travel_plan_recommend_provider.dart';
import 'package:application_new/shared/provider/travel_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanRecommendPage extends ConsumerStatefulWidget {
  final int _travelId;

  const TravelPlanRecommendPage({super.key, required int travelId})
      : _travelId = travelId;

  @override
  ConsumerState createState() => _TravelPlanRecommendPageState();
}

class _TravelPlanRecommendPageState
    extends ConsumerState<TravelPlanRecommendPage> {

  FutureOr<Null> fetch() {
    for (int i = 0; i < 5; i++) {
      final state = ref.read(travelPlanProvider(widget._travelId));

      final cities = state.detail.travel.cities;
      final city = cities[state.cityIndex];
      ref
          .read(travelPlanRecommendProvider(widget._travelId, city).notifier)
          .random();
    }
  }

  @override
  Widget build(BuildContext context) {
    final travelId = widget._travelId;
    final state = ref.watch(travelPlanProvider(travelId));

    final cities = state.detail.travel.cities;
    final city = cities[state.cityIndex];

    final recommendations =
        ref.watch(travelPlanRecommendProvider(travelId, city)).recommendations;

    ref.listen(travelPlanProvider(travelId), (prev, next) {
      final cities = next.detail.travel.cities;
      final city = cities[next.cityIndex];

      if (ref
          .read(travelPlanRecommendProvider(travelId, city))
          .recommendations
          .isNotEmpty) {
        return;
      }

      fetch();
    });

    return SliverList(
      delegate: SliverChildListDelegate([
        SingleChildScrollView(
            child: Row(children: [
          for (int i = 0; i < state.detail.travel.cities.length; i++)
            TravelCityItem(
                city: state.detail.travel.cities[i],
                isSelected: state.cityIndex == i,
                onSelected: () => ref
                    .read(travelPlanProvider(travelId).notifier)
                    .selectCity(i)),
        ])),
        const SizedBox(height: 48.0),
        for (final recommend in recommendations)
          RecommendItem(recommend: recommend),
        const SizedBox(height: 48.0),
      ]),
    );
  }
}
