import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_page.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/sliver_city_poi_preview.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_recommend_place_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/sliver_city_travel_preview.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/provider/travel_plan_recommend_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/provider/travel_plan_recommend_state.dart';
import 'package:application_new/shared/component/sliver_infinite_list_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanRecommendPage extends ConsumerStatefulWidget {
  final int travelId;
  final int cityId;

  const TravelPlanRecommendPage(
      {super.key, required this.travelId, required this.cityId});

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
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final (travelId, cityId) = (widget.travelId, widget.cityId);

    if (cityId == null) return const LoadingPage();

    final state = ref.watch(travelPlanRecommendProvider(travelId, cityId));

    if (state == null) return const LoadingPage();

    final TravelPlanRecommendState(
      :placeRecommends,
      :hasNextPage,
      :travel,
      :city
    ) = state;

    return Scaffold(
      appBar: AppBar(
        title: Text(travel.name),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8.0,
                      children: [
                        const SizedBox(width: 16.0),
                        // for (int i = 0; i < travel.cities.length; i++)
                        //   FilterChip(
                        //       onSelected: (_) => ref
                        //           .read(travelPlanProvider(travelId).notifier)
                        //           .selectCity(i),
                        //       label: Text(travel.cities[i].name),
                        //       selected: travel.cities[i].id == cityId)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            )),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverMainAxisGroup(slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
            SliverCityPoiPreview(travelId: travelId, cityId: cityId),
            const SliverToBoxAdapter(child: SizedBox(height: 72.0)),
            SliverCityTravelPreview(travelId: travelId, cityId: cityId),
            const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.maxFinite,
                      height: 16.0,
                      color: colorScheme.surfaceContainerLow),
                  const SizedBox(height: 48.0),
                ],
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => CityRecommendPlaceView(
                        travel: travel, placeRecommend: placeRecommends[index]),
                    childCount: placeRecommends.length)),
            SliverInfiniteListIndicator(
                hasNextPage: hasNextPage,
                onVisible: ref
                    .read(
                        travelPlanRecommendProvider(travelId, cityId).notifier)
                    .fetch)
          ]),
        ],
      ),
    );
  }
}
