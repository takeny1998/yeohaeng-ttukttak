import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_plan/city_travels/provider/city_travels_provider.dart';
import 'package:application_new/feature/travel_plan/city_travels/provider/city_travels_state.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/component/travel_item.dart';
import 'package:application_new/shared/component/infinite_list_indicator.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CityTravelsPage extends ConsumerWidget {
  final TravelModel travel;
  final CityModel city;

  const CityTravelsPage({super.key, required this.travel, required this.city});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CityTravelsState(:travels, :hasNextPage) =
        ref.watch(cityTravelsProvider(travel, city.id));

    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
          itemCount: travels.length + 1,
          separatorBuilder: (context, index) => index != travels.length
              ? const SizedBox(height: 56.0)
              : const Placeholder(),
          itemBuilder: (context, index) => index == travels.length
              ? Expanded(
                  child: InfiniteListIndicator(
                      onVisible: ref
                          .read(cityTravelsProvider(travel, city.id).notifier)
                          .fetch,
                      hasNextPage: hasNextPage))
              : TravelItem(travel: travels[index])),
    );
  }
}
