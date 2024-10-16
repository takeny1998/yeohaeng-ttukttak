import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/geography/provider/geography_provider.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/shared/component/custom_header_delegate.dart';
import 'package:application_new/shared/component/filled_chip_theme.dart';
import 'package:application_new/shared/component/travel_header.dart';
import 'package:application_new/shared/model/travel/travel_detail_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanPage extends ConsumerWidget {
  final int _travelId;

  const TravelPlanPage({super.key, required int travelId})
      : _travelId = travelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final state = ref.watch(travelPlanProvider(_travelId));

    final TravelDetailModel(:travel) = state.detail;

    final nameStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);
    final dateStyle = textTheme.bodyMedium
        ?.copyWith(fontWeight: FontWeight.w600, color: colorScheme.secondary);

    final regions = ref.watch(geographyProvider).regions;

    return FilledChipTheme(
      child: DefaultTabController(
        length: travel.cities.length,
        child: Scaffold(
            body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 202.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      24.0, kToolbarHeight, 24.0, 0.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(travel.formattedName, style: nameStyle),
                        Text(travel.formattedDate, style: dateStyle),
                        const SizedBox(height: 16.0),
                        Wrap(spacing: 8.0, children: [
                          Chip(
                              backgroundColor: colorScheme.primary,
                              labelStyle:
                                  TextStyle(color: colorScheme.onPrimary),
                              label: Text(enumKey(travel.companionType).tr())),
                          for (final motivation in travel.motivations)
                            Chip(label: Text(enumKey(motivation).tr())),
                          const SizedBox(height: 32.0),
                        ]),
                      ]),
                )),
              ),
            ),
            SliverPersistentHeader(
                pinned: true,
                delegate: CustomHeaderDelegate(
                    extent: 64.0,
                    widget: TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3.0,
                      labelPadding:
                          const EdgeInsets.symmetric(horizontal: 21.0),
                      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                      tabs: [
                        for (final city in travel.cities)
                          Builder(builder: (context) {

                            final region = regions
                                .firstWhere(
                                    (region) => region.id == city.regionId);

                            return Tab(
                              height: 64.0,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                Text(city.name, style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.primary
                                )),
                                Text(region.name, style: textTheme.labelMedium?.copyWith(color: colorScheme.secondary, fontWeight: FontWeight.w600))
                              ]),
                            );
                          })
                      ],
                    ))),
            SliverToBoxAdapter(
              child: Container(
                width: double.maxFinite,
                height: 4200,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
