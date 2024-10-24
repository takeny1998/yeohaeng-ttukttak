import 'dart:math';

import 'package:application_new/feature/travel_plan/component/travel_city_item.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/component/recommend_item.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/recommend_model.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/provider/travel_plan_recommend_provider.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/provider/travel_plan_recommend_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  final PagingController<int, RecommendModel> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final travelId = widget._travelId;

    final state = ref.watch(travelPlanProvider(travelId));
    final cityIndex = state.cityIndex;

    final TravelPlanRecommendState(:recommendations) =
        ref.watch(travelPlanRecommendProvider(travelId, cityIndex));

    return SliverMainAxisGroup(slivers: [
      SliverToBoxAdapter(
        child: SingleChildScrollView(
            child: Row(children: [
          for (int i = 0; i < state.detail.travel.cities.length; i++)
            TravelCityItem(
                city: state.detail.travel.cities[i],
                isSelected: cityIndex == i,
                onSelected: () => ref
                    .read(travelPlanProvider(travelId).notifier)
                    .selectCity(i)),
        ])),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          margin: index == 0 ? const EdgeInsets.only(top: 48.0) : null,
          child: RecommendItem(recommend: recommendations[index]),
        );
      }, childCount: recommendations.length)),
      SliverFillRemaining(
          hasScrollBody: false,
          child: VisibilityDetector(
            key: const Key('key'),
            onVisibilityChanged: (VisibilityInfo info) {
              final isVisible = info.visibleFraction > 0.0;

              if (!isVisible) return;

              ref
                  .read(
                      travelPlanRecommendProvider(travelId, cityIndex).notifier)
                  .random();
            },
            child: Container(
              constraints: const BoxConstraints(minHeight: 120.0),
              child: const Center(child: CircularProgressIndicator()),
            ),
          )),
    ]);
  }
}
