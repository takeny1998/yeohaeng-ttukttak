import 'package:application_new/core/scroll/infinite_scroll_model.dart';
import 'package:application_new/feature/travel_city_attraction/travel_city_attraction_provider.dart';
import 'package:application_new/feature/travel_city_attraction/travel_city_attraction_state.dart';
import 'package:application_new/shared/component/infinite_list_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelCityAttractionView extends ConsumerWidget {
  final int travelId, cityId;

  const TravelCityAttractionView(
      {super.key, required this.travelId, required this.cityId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState =
        ref.watch(travelCityAttractionProvider(travelId, cityId));

    return asyncState.when(
      data: (state) {
        final TravelCityAttractionState(:attractions) = state;

        return CustomScrollView(slivers: [
          SliverList.builder(
              itemCount: attractions.length,
              itemBuilder: (context, index) {
                final attraction = attractions[index];

                return Column(children: [
                  for (final place in attraction.records)
                    Column(children: [
                      Container(width: 400, height: 320, color: Colors.blue),
                      Text(place.name)
                    ])
                ]);
              }),

          SliverFillRemaining(
            child: InfiniteListIndicator(
                onVisible: () => print('hi'),
                hasNextPage: InfiniteScrollModel.resolveHasNext(attractions)),
          )
        ]);
      },
      error: (error, stack) {
        print(stack);
        throw error;
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
