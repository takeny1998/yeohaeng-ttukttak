import 'dart:math';

import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/component/travel_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_travels/provider/city_travels_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_travels/provider/city_travels_state.dart';
import 'package:application_new/shared/util/constants.dart';
import 'package:application_new/shared/util/snap_scroll_physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SliverCityTravelPreview extends ConsumerWidget {
  final int cityId, travelId;

  final psy = const PageScrollPhysics();

  const SliverCityTravelPreview(
      {super.key, required this.cityId, required this.travelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final titleStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    final state = ref.watch(cityTravelsProvider(travelId, cityId));

    if (state == null) {
      return const SliverToBoxAdapter(
        child: SizedBox(
            height: 240, child: Center(child: CircularProgressIndicator())),
      );
    }

    final CityTravelsState(:travels) = state;
    final Size(width: deviceWidth) = MediaQuery.of(context).size;

    final itemExtent = min(Constants.maxItemWidth, deviceWidth);

    final tr = ref.watch(translationServiceProvider);

    return SliverToBoxAdapter(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(
            tr.from('travelogues_in_city_name', args: [ state.city.name ]),
            style: titleStyle),
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
          child: FilledButton(
              onPressed: () =>
                  context.push('/travels/$travelId/cities/$cityId/travels/'),
              child: Text(tr.from('read_more')))),
    ]));
  }
}
