import 'dart:math';

import 'package:application_new/common/router/router_provider.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/home/home_page.dart';
import 'package:application_new/feature/travel_plan/component/travel_city_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_page.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/component/recommend_place_item.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/component/recommend_travel_item.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/recommend_model.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/provider/travel_plan_recommend_provider.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/provider/travel_plan_recommend_state.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TravelPlanRecommendPage extends ConsumerStatefulWidget {
  final int _travelId;

  const TravelPlanRecommendPage({super.key, required int travelId})
      : _travelId = travelId;

  @override
  ConsumerState createState() => _TravelPlanRecommendPageState();
}

class _TravelPlanRecommendPageState
    extends ConsumerState<TravelPlanRecommendPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final scrollController = travelPlanPageKey.currentState?.innerController;

      if (scrollController == null) return;

      scrollController.addListener(() {
        final offset = scrollController.offset;

        if (offset > 120.0) return;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final travelId = widget._travelId;

    final state = ref.watch(travelPlanProvider(travelId));
    final cityIndex = state.cityIndex;

    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final TravelPlanRecommendState(:recommendations, :hasNextPage) =
        ref.watch(travelPlanRecommendProvider(travelId, cityIndex));

    final cities = state.detail.travel.cities;

    return SliverMainAxisGroup(slivers: [
      SliverToBoxAdapter(
        child: SingleChildScrollView(
            child: Row(children: [
          for (int i = 0; i < cities.length; i++)
            TravelCityItem(
                city: cities[i],
                isSelected: cityIndex == i,
                onSelected: () => ref
                    .read(travelPlanProvider(travelId).notifier)
                    .selectCity(i)),
        ])),
      ),
      SliverPadding(
        padding: const EdgeInsets.only(top: 24.0),
        sliver: SliverGrid(
            delegate: SliverChildListDelegate([
              for (final categoryType in PlaceCategoryType.values)
                InkWell(
                  onTap: () => context.push('/cities/${cities[cityIndex].id}/places?categoryType=${categoryType.name}'),
                  splashColor: colorScheme.primaryContainer,
                  highlightColor: colorScheme.primaryContainer,
                  child: Column(children: [
                    const SizedBox(height: 24.0),
                    CircleAvatar(radius: 24.0,
                    child: Icon(categoryType.iconData, color: colorScheme.primary)),
                    const SizedBox(height: 12.0),
                    Text(enumKey(categoryType).tr(),
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 24.0),
                  ]),
                )
            ]),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 141.0,
                maxCrossAxisExtent: 120.0)),
      ),
      SliverToBoxAdapter(
        child: Container(
          width: double.maxFinite,
          height: 16.0,
          color: colorScheme.surfaceContainerLow,
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        final child = switch (recommendations[index]) {
          (RecommendPlaceModel model) =>
            RecommendPlaceItem(recommendPlaceModel: model),
          (RecommendTravelModel model) =>
            RecommendTravelItem(recommendTravelModel: model),
        };
        return child;
      }, childCount: recommendations.length)),
      if (hasNextPage)
        SliverFillRemaining(
            hasScrollBody: false,
            child: VisibilityDetector(
              key: const Key('key'),
              onVisibilityChanged: (VisibilityInfo info) {
                final isVisible = info.visibleFraction > 0.0;
                if (!isVisible) return;

                ref
                    .read(travelPlanRecommendProvider(travelId, cityIndex)
                        .notifier)
                    .fetch();
              },
              child: Container(
                constraints: const BoxConstraints(minHeight: 120.0),
                child: const Center(child: CircularProgressIndicator()),
              ),
            )),
    ]);
  }
}
