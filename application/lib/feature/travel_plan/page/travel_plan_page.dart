import 'dart:async';

import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/feature/travel_plan/component/travel_plan_home_header.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_bookmark_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_home_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_manage_page.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_state.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/travel_plan_recommend_page.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NestedScrollViewState> travelPlanPageKey = GlobalKey();

class TravelPlanPage extends ConsumerStatefulWidget {
  final int travelId;

  const TravelPlanPage({super.key, required this.travelId});

  @override
  ConsumerState createState() => _TravelPlanPageState();
}

class _TravelPlanPageState extends ConsumerState<TravelPlanPage> {
  final scrollController = ScrollController();
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(travelPlanProvider(widget.travelId));

    if (state == null) return const LoadingPage();

    final TravelPlanState(:travel, :pageIndex, :cityIndex) = state;

    final cityId = travel.cities[cityIndex].id;

    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: [
          const TravelPlanHomePage(),
          TravelPlanRecommendPage(travelId: widget.travelId, cityId: cityId),
          TravelPlanManagePage(travelId: widget.travelId),
          TravelPlanBookmarkPage(travelId: widget.travelId),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageIndex,
        onDestinationSelected: (index) =>
            ref.read(travelPlanProvider(widget.travelId).notifier).changePage(index),
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
