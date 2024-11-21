import 'dart:math';

import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/places_map_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_place_pois/provider/city_place_pois_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_place_pois/provider/city_place_pois_state.dart';
import 'package:application_new/shared/util/constants.dart';
import 'package:application_new/shared/util/snap_scroll_physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../component/place_metric_card_indicator.dart';
import '../component/place_metric_card_item.dart';

class TravelCityPoisMapView extends ConsumerWidget {
  final CityPlacePoisProvider provider;
  final CityPlacePoisState state;

  const TravelCityPoisMapView(
      {super.key,
      required this.provider,
      required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CityPlacePoisState(:hasNextPage, :placeMetrics) = state;

    final screenSize = MediaQuery.of(context).size.width;

    const cardHeight = 152.0;
    final itemWidth = min(screenSize, Constants.maxItemWidth);

    final bottomPadding =
        MediaQuery.of(context).padding.bottom + 50.0 + 24.0 + 16.0;

    return Stack(alignment: Alignment.bottomCenter, children: [
      PlacesMapView(
        padding: EdgeInsets.only(bottom: bottomPadding + cardHeight),
        places: placeMetrics.map((e) => e.place).toList(),
      ),
      Container(
        height: cardHeight,
        margin: EdgeInsets.only(bottom: bottomPadding),
        child: ListView.builder(
            padding: EdgeInsets.only(left: (screenSize - itemWidth) / 2.0),
            physics: SnapScrollPhysics(itemWidth: itemWidth),
            scrollDirection: Axis.horizontal,
            itemCount:
                hasNextPage ? placeMetrics.length + 1 : placeMetrics.length,
            itemBuilder: (context, index) {
              if (index == placeMetrics.length && hasNextPage) {
                return PlaceMetricCardIndicator(provider);
              }
              return VisibilityDetector(
                key: ValueKey<int>(placeMetrics[index].place.id),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction != 1.0) return;
                },
                child: Container(
                    width: itemWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child:
                        PlaceMetricCardItem(placeMetric: placeMetrics[index])),
              );
            }),
      ),
    ]);
  }
}
