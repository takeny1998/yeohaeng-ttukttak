import 'dart:async';

import 'package:animations/animations.dart';
import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/feature/travel/travel_city_page.dart';
import 'package:application_new/feature/travel_plan/component/travel_plan_home_header.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_bookmark_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_participant/page/travel_plan_participant_page.dart';
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
    final provider = travelPlanProvider(widget.travelId);
    final state = ref.watch(provider).value;

    if (state == null) return const LoadingPage();


    final TravelPlanState(:travel, :pageIndex, :selectedCity) = state;

    ref.listen(provider, (prev, next) {
      if (prev?.value?.pageIndex == next.value?.pageIndex) return;


      pageController.animateToPage(next.value!.pageIndex, duration: const Duration(milliseconds: 200), curve: Curves.linear);
    });

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
        TravelPlanHomePage(provider: provider, state: state),
        TravelCityPage(provider: provider, state: state),
        TravelPlanManagePage(travelId: widget.travelId),
        TravelPlanBookmarkPage(travelId: widget.travelId)
      ],),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHigh))),
        child: NavigationBar(
          selectedIndex: pageIndex,
          onDestinationSelected: (index) => ref
              .read(provider.notifier)
              .changePage(index),
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: '메인'),
            NavigationDestination(
                selectedIcon: Icon(Icons.place),
                icon: Icon(Icons.place_outlined),
                label: '둘러보기'),
            NavigationDestination(
                selectedIcon: Icon(Icons.map),
                icon: Icon(Icons.map_outlined),
                label: '일정'),
            NavigationDestination(
                selectedIcon: Icon(Icons.bookmark),
                icon: Icon(Icons.bookmark_outline),
                label: '저장'),
          ],
        ),
      ),
    );
  }
}
