
import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_mange_list_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


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
      ),
      body: TravelPlanMangeListView(
        travel: travel,
        visitPlaces: selectedVisitPlaces,
        onChangeDate: (date) => ref
            .read(travelPlanManageProvider(travelId).notifier)
            .selectDate(date),
        selectedDate: selectedDate,
      ),
    );
  }
}
