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
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final travelId = widget._travelId;

    final List<Widget> pages = [
      TravelPlanHomePage(travelId: travelId),
      TravelPlanRecommendPage(travelId: travelId),
      TravelPlanManagePage(travelId: travelId),
      TravelPlanBookmarkPage(travelId: travelId),
    ];

    final pageIndex = ref.watch(travelPlanProvider(travelId)).pageIndex;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: colorScheme.surface,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          )
        ],
      ),
      body: AnimatedSwitcher(
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        duration: const Duration(milliseconds: 200),
        child: pages[pageIndex],
      ),
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
