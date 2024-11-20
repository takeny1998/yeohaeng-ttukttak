import 'dart:math';

import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/places_map_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_list_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_manage_edit_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_mange_list_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_state.dart';
import 'package:application_new/shared/component/fixed_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'travel_plan_date_view.dart';

class TravelPlanManagePage extends ConsumerWidget {
  final int travelId;

  const TravelPlanManagePage({super.key, required this.travelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);
    final state = ref.watch(travelPlanManageProvider(travelId));

    if (state == null) {
      return const LoadingPage();
    }

    final TravelPlanManageState(:travel, :visitPlaces, :selectedDate) = state;

    final selectedVisitPlaces = visitPlaces
        .where((visitPlace) =>
            DateUtils.isSameDay(visitPlace.visit.visitedOn, selectedDate))
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(travel.formattedName),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: IconButton.filledTonal(
                onPressed: () => TravelPlanManageEditView.showSheet(context,
                    travelId: travelId, visitPlaces: visitPlaces),
                icon: Icon(Icons.edit, color: colorScheme.primary)),
          )
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverPersistentHeader(
            pinned: true,
            delegate: FixedHeaderDelegate(
                widget: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    border: Border(
                        bottom: BorderSide(
                            color: colorScheme.surfaceContainerHigh)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      TravelPlanDateView(
                        onChangeDate: (date) => ref
                            .read(travelPlanManageProvider(travelId).notifier)
                            .selectDate(date),
                        travel: travel,
                        selectedDate: selectedDate,
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
                extent: 85.0)),
        SliverFillRemaining(
          child: TravelPlanMangeListView(visitPlaces: selectedVisitPlaces))
      ]),
    );
  }
}
