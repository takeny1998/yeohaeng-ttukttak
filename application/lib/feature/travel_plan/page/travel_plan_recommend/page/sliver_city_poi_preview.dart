import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/component/place_metric_item.dart';
import 'package:application_new/shared/util/snap_scroll_physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'city_place_pois/provider/city_place_pois_provider.dart';
import 'city_place_pois/provider/city_place_pois_state.dart';


class SliverCityPoiPreview extends ConsumerWidget {
  final int cityId;

  const SliverCityPoiPreview({super.key, required this.cityId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state =
    ref.watch(cityPlacePoisProvider(cityId, PlaceSortType.rating));

    if (state == null) {
      return const SliverToBoxAdapter(
        child: SizedBox(
            height: 240, child: Center(child: CircularProgressIndicator())),
      );
    }

    final CityPlacePoisState(:placeMetrics) = state;

    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final titleStyle =
    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    const itemWidth = 240.0;
    const paddingWidth = 24.0;

    final translator = TranslationUtil.widget(context);

    return SliverToBoxAdapter(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(translator.key('pois_of_city', args: { 'city_name': state.city.name}), style: titleStyle),
          ),
          const SizedBox(height: 16.0),
          SingleChildScrollView(
              physics: const SnapScrollPhysics(itemWidth: itemWidth + paddingWidth),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingWidth),
                child: Row(children: [
                  for (final placeMetric in placeMetrics.take(5)) ...[
                    SizedBox(
                        width: itemWidth,
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
                      context.push('/cities/${state.city.id}/places/pois'),
                  child: Text(translator.key('view_detail')))),
        ]),
    );
  }
}
