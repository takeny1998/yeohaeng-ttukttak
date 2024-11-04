import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/home/home_page.dart';
import 'package:application_new/feature/travel_plan/city_place_list/provider/city_place_list_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_list/provider/city_place_list_state.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CityPlaceListPage extends ConsumerWidget {
  final int cityId;
  final PlaceCategoryType categoryType;

  const CityPlaceListPage(
      {super.key, required this.cityId, required this.categoryType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final CityPlaceListState(:placeMetrics, :hasNextPage) =
        ref.watch(cityPlaceListProvider(cityId, categoryType));

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          final PlaceMetricModel(:place, :rating) = placeMetrics[index];

          final titleStyle =
              textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);
          final subTitleStyle =
              TextStyle(fontSize: 13.0, color: colorScheme.onSurfaceVariant);

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: Row(
                children: [
              Expanded(
                  flex: 4,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                          height: 80.0, color: colorScheme.primaryContainer))),
              const Spacer(flex: 1),
              Expanded(
                  flex: 16,

                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(place.name, style: titleStyle),
                        Text(place.address.value ?? '', style: subTitleStyle),
                        const SizedBox(height: 4.0),
                        Wrap(spacing: 8.0, children: [
                          if (rating != null)
                            SmallChip(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                                leading: Icon(Icons.star_rate_rounded,
                                    color: colorScheme.onPrimary),
                                label: rating.toStringAsFixed(1)),
                          for (final categoryType in place.categoryTypes)
                            SmallChip(label: enumKey(categoryType).tr()),

                        ])
                      ])),
            ]),
          );
        }, childCount: placeMetrics.length)),
        if (hasNextPage)
          SliverFillRemaining(
              hasScrollBody: false,
              child: VisibilityDetector(
                key: const Key('key'),
                onVisibilityChanged: (VisibilityInfo info) {
                  final isVisible = info.visibleFraction > 0.0;
                  if (!isVisible) return;
                  ref
                      .read(
                          cityPlaceListProvider(cityId, categoryType).notifier)
                      .fetch();
                },
                child: Container(
                  constraints: const BoxConstraints(minHeight: 120.0),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              )),
      ]),
    );
  }
}
