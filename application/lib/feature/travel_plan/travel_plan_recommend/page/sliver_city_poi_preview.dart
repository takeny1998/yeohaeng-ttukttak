import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_state.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/component/place_metric_item.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/page/sliver_city_travel_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class SliverCityPoiPreview extends ConsumerWidget {
  final CityModel city;

  const SliverCityPoiPreview({super.key, required this.city});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CityPlacePoisState(:placeMetrics) =
    ref.watch(cityPlacePoisProvider(city.id, PlaceSortType.rating));

    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final titleStyle =
    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    return SliverToBoxAdapter(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('${city.name} 관광 명소 모음', style: titleStyle),
          ),
          const SizedBox(height: 16.0),
          SingleChildScrollView(
              physics: const CustomScrollPhysics(itemDimension: 264.0),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(children: [
                  for (final placeMetric in placeMetrics.take(5)) ...[
                    SizedBox(
                        width: 240.0,
                        child: PlaceMetricItem(placeMetric: placeMetric)),
                    const SizedBox(width: 24.0),
                  ],
                ]),
              )),
          const SizedBox(height: 16.0),
          Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: FilledButton(
                  onPressed: () =>
                      context.push('/cities/${city.id}/places/pois'),
                  child: const Text('자세히 보기'))),
        ]));
  }
}