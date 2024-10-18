import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/geography/provider/geography_provider.dart';
import 'package:application_new/feature/travel_plan/component/travel_plan_home_header.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_bookmark_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_home_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend_page.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/shared/model/travel/travel_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanPage extends ConsumerStatefulWidget {
  final int _travelId;

  const TravelPlanPage({super.key, required int travelId})
      : _travelId = travelId;

  @override
  ConsumerState createState() => _TravelPlanPageState();
}

class _TravelPlanPageState extends ConsumerState<TravelPlanPage> {
  final scrollController = ScrollController();
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final travelId = widget._travelId;

    final pageIndex = ref.watch(travelPlanProvider(travelId)).pageIndex;
    final travel = ref.watch(travelPlanProvider(travelId)).detail.travel;

    ref.listen(travelPlanProvider(travelId), (prev, next) {
      final offset = next.pageIndex == 0 ? 0.0 : 180.0;

      scrollController.animateTo(offset,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });

    final List<Widget> pages = [
      TravelPlanHomePage(travelId: travelId),
      TravelPlanRecommendPage(travelId: travelId),
      TravelPlanManagePage(travelId: travelId),
      TravelPlanBookmarkPage(travelId: travelId),
    ];

    return Scaffold(
      body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: TravelPlanHomeHeader(travel: travel))
            ];
          },
          body: Builder(builder: (context) {
            return CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context)),
                pages[pageIndex],
              ],
            );
          })),
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageIndex,
        onDestinationSelected: (index) =>
            ref.read(travelPlanProvider(travelId).notifier).changePage(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: '메인'),
          NavigationDestination(icon: Icon(Icons.place), label: '둘러보기'),
          NavigationDestination(icon: Icon(Icons.map), label: '일정'),
          NavigationDestination(icon: Icon(Icons.bookmark), label: '저장'),
        ],
      ),
    );
  }
}
