import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/places_map_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_date_range_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_mange_list_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TravelPlanManagePage extends ConsumerWidget {
  final int travelId;

  const TravelPlanManagePage({super.key, required this.travelId});

  final dragHandleHeight = 24.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    void onChangeDate(date) {
      ref
          .read(travelPlanManageProvider(travelId).notifier)
          .selectDate(date);
    }

    final state = ref.watch(travelPlanManageProvider(travelId));

    if (state == null) {
      return const LoadingPage();
    }

    final TravelPlanManageState(:travel, :visitPlaces, :selectedDate, :isAnimating, :mapHeightLevel) = state;

    final ThemeData(:colorScheme) = Theme.of(context);

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
      body: LayoutBuilder(builder: (context, constraints) {
        final bodyHeight = constraints.maxHeight;

        return Column(
          children: [
            AnimatedContainer(
              onEnd: ref.read(travelPlanManageProvider(travel.id).notifier).endAnimating,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
              height: (bodyHeight - dragHandleHeight - 81.0) *
                  TravelPlanManage.mapHeightRatios[mapHeightLevel],
              child: PlacesMapView(
                usePolyline: true,
                places: selectedVisitPlaces.map((e) => e.place).toList(),
              ),
            ),
            GestureDetector(
              onVerticalDragUpdate: (detail) =>
                  ref
                      .read(travelPlanManageProvider(travelId).notifier)
                      .updateMapHeight(detail.delta.dy),
              child: Container(
                  width: double.maxFinite,
                  height: dragHandleHeight,
                  color: Colors.transparent,
                  child: Center(
                      child: Container(
                        width: 56.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                            color: colorScheme.surfaceDim,
                            borderRadius: BorderRadius.circular(16.0)),
                      ))),
            ),
            TravelDateRangeView(
                travel: travel,
                onChangeDate: onChangeDate,
                selectedDate: selectedDate,
                builder: (item, index) {
                  return DragTarget(
                      onMove: (detail) => onChangeDate(
                          travel.startedOn.add(Duration(days: index))),
                      builder: (context, candidateData, rejectedData) => item);
                }),
            Expanded(
              child: TravelPlanMangeListView(
                  travel: travel,
                  visitPlaces: selectedVisitPlaces,
                  selectedDate: selectedDate,
                  onChangeDate: onChangeDate),
            ),
          ],
        );
      }),
    );
  }

}
