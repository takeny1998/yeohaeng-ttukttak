import 'dart:math';

import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_plan/city_travels/model/paged_travels_model.dart';
import 'package:application_new/feature/travel_plan/city_travels/provider/city_travels_provider.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/component/travel_item.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:application_new/shared/util/snap_scroll_physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliverCityTravelPreview extends ConsumerWidget {
  final TravelModel travel;
  final CityModel city;

  final psy = const PageScrollPhysics();

  const SliverCityTravelPreview(
      {super.key, required this.travel, required this.city});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final titleStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    final PagedTravelsModel(:travels) =
        ref.watch(cityTravelsProvider(travel, city.id)).pagedTravels;

    const itemWidth = 420.0;
    final Size(width: deviceWidth) = MediaQuery.of(context).size;

    final itemExtent = min(itemWidth, deviceWidth);

    return SliverToBoxAdapter(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text('${city.name} 여행기 모음', style: titleStyle),
      ),
      const SizedBox(height: 24.0),
      SingleChildScrollView(
          physics: SnapScrollPhysics(itemWidth: itemExtent),
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            for (final travel in travels)
              Container(
                  width: itemExtent,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TravelItem(travel: travel)),
          ])),
      const SizedBox(height: 16.0),
      Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: FilledButton(onPressed: () {}, child: const Text('자세히 보기'))),
    ]));
  }
}