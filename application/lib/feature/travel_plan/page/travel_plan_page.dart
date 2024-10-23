import 'dart:async';

import 'package:application_new/feature/travel_plan/component/travel_plan_home_header.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_bookmark_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_home_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage_page.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/page/travel_plan_recommend_page.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  bool isHeaderSnapped = false;
  bool isHeaderScrolled = false;

  int animatingCount = 0;

  static const headerOffset = 180.0;

  final GlobalKey<NestedScrollViewState> globalKey = GlobalKey();

  FutureOr<void> animateTo(double offset, {required Duration duration}) {
    animatingCount++;

    scrollController.animateTo(offset,
        duration: duration, curve: Curves.linear);

    Future.delayed(Duration(milliseconds: duration.inMilliseconds + 100),
        () => animatingCount--);
  }

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
      final isHomePage = next.pageIndex == 0;

      final offset = isHomePage || (isHeaderSnapped && isHeaderScrolled)
          ? 0.0
          : headerOffset;

      const duration = Duration(milliseconds: 200);
      animateTo(offset, duration: duration);
    });

    final List<Widget> pages = [
      TravelPlanHomePage(travelId: travelId),
      TravelPlanRecommendPage(travelId: travelId),
      TravelPlanManagePage(travelId: travelId),
      TravelPlanBookmarkPage(travelId: travelId),
    ];

    return Scaffold(
      body: NestedScrollView(
          key: globalKey,
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            isHeaderScrolled = innerBoxIsScrolled;

            return [
              SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: TravelPlanHomeHeader(
                    travel: travel,
                    onScroll: (isCollapsed) {
                      isHeaderSnapped = !isCollapsed;

                      if (!isHeaderSnapped ||
                          !isHeaderScrolled ||
                          animatingCount > 0) return;

                      final bodyOffset =
                          globalKey.currentState?.innerController.offset;

                      if (bodyOffset == null || bodyOffset > 120.0) return;

                      animateTo(0.0,
                          duration: const Duration(milliseconds: 100));
                    },
                  ))
            ];
          },
          body: Builder(builder: (context) {
            return CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverLayoutBuilder(builder: (context, constraints) {
                  return SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context));
                }),
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
