import 'package:application_new/core/scroll/infinite_scroll_model.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/feature/travel_city_attraction/components/attraction_list_item.dart';
import 'package:application_new/feature/travel_city_attraction/travel_city_attraction_provider.dart';
import 'package:application_new/feature/travel_city_attraction/travel_city_attraction_state.dart';
import 'package:application_new/shared/component/infinite_list_indicator.dart';
import 'package:application_new/shared/util/snap_scroll_physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelCityAttractionView extends ConsumerWidget {
  final int travelId, cityId;

  const TravelCityAttractionView(
      {super.key, required this.travelId, required this.cityId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = travelCityAttractionProvider(travelId, cityId);
    final asyncState = ref.watch(provider);

    return asyncState.when(
      data: (state) {
        final TravelCityAttractionState(:travel, :attractions) = state;

        return CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
          SliverList.builder(
              itemCount: attractions.length,
              itemBuilder: (context, index) {
                final attraction = attractions[index];
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  for (final attraction in attraction.records)
                    AttractionListItem(
                        travel: travel, attraction: attraction)
                ]);
              }),
          SliverFillRemaining(
            child: InfiniteListIndicator(
                onVisible: () {
                  return ref.read(provider.notifier).fetch();
                },
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
