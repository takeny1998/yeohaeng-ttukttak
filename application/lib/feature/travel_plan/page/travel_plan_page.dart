import 'dart:async';

import 'package:application_new/feature/travel_plan/component/travel_plan_home_header.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_bookmark_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_home_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage_page.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/page/travel_plan_recommend_page.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/shared/provider/travel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NestedScrollViewState> travelPlanPageKey = GlobalKey();

class TravelPlanPage extends ConsumerStatefulWidget {
  final int id;

  const TravelPlanPage({super.key, required this.id});

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

  FutureOr<void> animateTo(double offset, {required Duration duration}) {
    animatingCount++;

    scrollController.animateTo(offset,
        duration: duration, curve: Curves.linear);

    Future.delayed(Duration(milliseconds: duration.inMilliseconds),
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
    final travel = ref.watch(travelProvider(widget.id));

    if (travel == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final pageIndex = ref.watch(travelPlanProvider(travel)).pageIndex;

    ref.listen(travelPlanProvider(travel), (prev, next) {
      final isHomePage = next.pageIndex == 0;

      final offset = isHomePage || (isHeaderSnapped && isHeaderScrolled)
          ? 0.0
          : headerOffset;

      const duration = Duration(milliseconds: 200);

      animateTo(offset, duration: duration);
    });

    final List<Widget> pages = [
      TravelPlanHomePage(travel: travel),
      TravelPlanRecommendPage(travel: travel),
      TravelPlanManagePage(travelId: travel.id),
      TravelPlanBookmarkPage(travelId: travel.id),
    ];

    return Scaffold(
      body: NestedScrollView(
          key: travelPlanPageKey,
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

                      if (isHeaderSnapped &&
                          isHeaderScrolled &&
                          animatingCount == 0) {
                        final bodyController =
                            travelPlanPageKey.currentState?.innerController;

                        if (bodyController == null) return;

                        if (bodyController.offset > 120.0) return;

                        isHeaderSnapped = false;
                        animateTo(0.0,
                            duration: const Duration(milliseconds: 300));
                      }
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
            ref.read(travelPlanProvider(travel).notifier).changePage(index),
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
