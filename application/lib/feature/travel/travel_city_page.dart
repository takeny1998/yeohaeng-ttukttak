import 'package:application_new/feature/travel_city_attraction/travel_city_attraction_view.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_state.dart';
import 'package:application_new/shared/component/content_top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelCityPage extends ConsumerWidget {
  final TravelPlanState state;
  final TravelPlanProvider provider;

  const TravelCityPage(
      {super.key, required this.state, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TravelPlanState(:cities, :selectedCity) = state;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ContentTopAppBar(
              child: SingleChildScrollView(
            child: Row(children: [
              const SizedBox(width: 24.0),
              for (final city in cities) ...[
                FilterChip(
                    onSelected: (_) =>
                        ref.read(provider.notifier).selectCity(city),
                    label: Text(city.shortName),
                    selected: city == selectedCity),
                const SizedBox(width: 8.0),
              ],
              const SizedBox(width: 24.0),
            ]),
          )),
          Expanded(
              child: TravelCityAttractionView(
                  travelId: provider.travelId, cityId: selectedCity.id)),
        ],
      ),
    );
  }
}
