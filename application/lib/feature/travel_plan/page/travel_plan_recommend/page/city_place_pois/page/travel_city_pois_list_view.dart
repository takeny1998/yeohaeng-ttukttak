import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_place_pois/provider/city_place_pois_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_place_pois/provider/city_place_pois_state.dart';
import 'package:application_new/shared/component/sliver_infinite_list_indicator.dart';
import 'package:application_new/shared/dto/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/place_metric_list_item.dart';

class TravelCityPoisListView extends ConsumerWidget {
  final ScrollController scrollController;
  final CityPlacePoisProvider provider;

  final CityPlacePoisState state;

  final PlaceSortType sortType;
  final VoidCallback onChangeSortType;

  const TravelCityPoisListView({
    super.key,
    required this.scrollController,
    required this.provider,
    required this.onChangeSortType,
    required this.sortType,
    required this.state,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final CityPlacePoisState(
    :placeMetrics,
        :hasNextPage,
        :travel,
        :selectedTypes,
    ) = state;

    return Container(
        constraints: BoxConstraints(maxWidth: Constants.maxContentWidth),
        child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                  child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                color: colorScheme.surface,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: colorScheme.onSurface),
                          onPressed: onChangeSortType,
                          child: Row(children: [
                            Text(TranslationUtil.enumValue(sortType),
                                style: textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w600)),
                            const Icon(Icons.arrow_drop_down),
                          ])),
                    ]),
              )),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => PlaceMetricListItem(
                          travel: travel, placeMetric: placeMetrics[index]),
                      childCount: placeMetrics.length)),
              SliverInfiniteListIndicator(
                  hasNextPage: hasNextPage,
                  onVisible: () => ref
                      .read(provider.notifier)
                      .fetch()),
              const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
            ]));
  }
}
