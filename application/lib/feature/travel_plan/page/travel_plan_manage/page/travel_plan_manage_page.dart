import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/places_map.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_list_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_manage_edit_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_state.dart';
import 'package:application_new/shared/component/fixed_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'travel_plan_date_view.dart';

class TravelPlanManagePage extends ConsumerWidget {
  final int travelId;

  const TravelPlanManagePage({super.key, required this.travelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(travelPlanManageProvider(travelId));

    if (state == null) {
      return const SliverFillRemaining(child: LoadingPage());
    }

    final TravelPlanManageState(:travel, :visitPlaces, :selectedDate) = state;

    final selectedVisitPlaces = visitPlaces
        .where((visitPlace) =>
            DateUtils.isSameDay(visitPlace.visit.visitedOn, selectedDate))
        .toList();

    final selectedPlaces =
        selectedVisitPlaces.map((visitPlace) => visitPlace.place).toList();

    return SliverMainAxisGroup(slivers: [
      SliverPersistentHeader(
          pinned: true,
          delegate: FixedHeaderDelegate(widget:
      PlacesMapView(places: selectedPlaces), extent: 320.0)),
      SliverToBoxAdapter(
          child: TextButton(
              onPressed: () => TravelPlanManageEditView.showSheet(context,
                  travelId: travelId, visitPlaces: visitPlaces),
              child: const Text('수정'))),
      SliverList(
          delegate: SliverChildListDelegate([
        TravelPlanDateView(
          onChangeDate: (date) => ref
              .read(travelPlanManageProvider(travelId).notifier)
              .selectDate(date),
          travel: travel,
          selectedDate: selectedDate,
        ),
        const SizedBox(height: 32.0),
      ])),
      SliverList.builder(
        itemBuilder: (context, index) => TravelPlanListItem(
            order: index, visitPlace: selectedVisitPlaces[index]),
        itemCount: selectedVisitPlaces.length,
      )
    ]);
  }
}
