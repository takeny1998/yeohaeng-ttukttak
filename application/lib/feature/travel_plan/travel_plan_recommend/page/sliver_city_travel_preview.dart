import 'dart:math';

import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_plan/city_travels/model/paged_travels_model.dart';
import 'package:application_new/feature/travel_plan/city_travels/provider/city_travels_provider.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/component/travel_item.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

    final (itemWidth, itemHeight) = (480.0, 342.0);
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
          physics: CustomScrollPhysics(itemDimension: itemExtent),
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            for (final travel in travels)
              Container(
                  width: itemExtent,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TravelItem(travel: travel)),
          ])),
      const SizedBox(height: 24.0),
      Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: FilledButton(
              onPressed: () => context.push('/cities/${city.id}/places/pois'),
              child: const Text('자세히 보기')))
    ]));
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  final double itemDimension;

  const CustomScrollPhysics({required this.itemDimension, super.parent});

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(
        itemDimension: itemDimension, parent: buildParent(ancestor));
  }

  double _getPage(ScrollMetrics position) {
    return position.pixels / itemDimension;
  }

  double _getPixels(double page) {
    return page * itemDimension;
  }

  double _getTargetPixels(
      ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    return _getPixels(page.roundToDouble());
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }

    final tolerance = toleranceFor(position);
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        target,
        velocity,
        tolerance: tolerance,
      );
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
