import 'package:application_new/feature/travel_plan/component/travel_city_item.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/component/recommend_item.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/provider/travel_plan_recommend_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TravelPlanRecommendPage extends ConsumerWidget {
  final int _travelId;

  const TravelPlanRecommendPage({super.key, required int travelId})
      : _travelId = travelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(travelPlanProvider(_travelId));

    final cities = state.detail.travel.cities;
    final city = cities[state.cityIndex];

    final recommendations =
        ref.watch(travelPlanRecommendProvider(_travelId, city)).recommendations;

    return SliverList(
      delegate: SliverChildListDelegate([
        SingleChildScrollView(
            child: Row(children: [
              for (int i = 0; i < state.detail.travel.cities.length; i++)
                TravelCityItem(
                    city: state.detail.travel.cities[i],
                    isSelected: state.cityIndex == i,
                    onSelected: () => ref
                        .read(travelPlanProvider(_travelId).notifier)
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
