import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_date_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_list_drag_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_list_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_date_view.dart';
import 'package:application_new/shared/component/fixed_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanMangeListView extends ConsumerStatefulWidget {
  final TravelModel travel;
  final List<TravelVisitWithPlaceModel> visitPlaces;
  final DateTime selectedDate;
  final Function(DateTime) onChangeDate;

  const TravelPlanMangeListView(
      {super.key,
      required this.travel,
      required this.visitPlaces,
      required this.selectedDate,
      required this.onChangeDate});

  @override
  ConsumerState createState() => _TravelPlanMangeListViewState();
}

class _TravelPlanMangeListViewState
    extends ConsumerState<TravelPlanMangeListView> {
  final scrollController = ScrollController();

  bool isDragging = false;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final daysOfTravel = DateTimeRange(
            start: widget.travel.startedOn, end: widget.travel.endedOn)
        .duration
        .inDays;

    return Column(
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: colorScheme.surfaceContainerHigh))),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(width: 16.0),
              for (int i = 0; i < daysOfTravel; i++) ...[
                DragTarget(
                    onMove: (detail) => widget.onChangeDate(
                        widget.travel.startedOn.add(Duration(days: i))),
                    builder: (context, candidateData, rejectedData) =>
                        TravelDateItem(
                            dayOfTravel: i,
                            travel: widget.travel,
                            selectedDate: widget.selectedDate,
                            onChangeDate: widget.onChangeDate)),
                const SizedBox(width: 8.0),
              ],
              const SizedBox(width: 16.0),
            ]),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 24.0),
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    final visitPlace = widget.visitPlaces[index];
                    final listItem = DragTarget<TravelVisitWithPlaceModel>(
                        builder: (context, candidateData, rejectedData) {
                      return Column(
                        children: [
                          if (candidateData.isNotEmpty)
                            Opacity(
                                opacity: 0.5,
                                child: TravelPlanListItem(
                                    order: index,
                                    visitPlace: candidateData.first!)),
                          TravelPlanListItem(
                              order: index, visitPlace: visitPlace),
                        ],
                      );
                    });

                    return LongPressDraggable<TravelVisitWithPlaceModel>(
                      data: visitPlace,
                      feedback: TravelPlanListDragItem(visitPlace: visitPlace),
                      dragAnchorStrategy: childDragAnchorStrategy,
                      childWhenDragging: const SizedBox(),
                      child: listItem,
                    );
                  },
                  itemCount: widget.visitPlaces.length,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: DragTarget<TravelVisitWithPlaceModel>(
                  builder: (context, accepted, rejected) => Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                  onMove: (detail) => scrollUp(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: DragTarget<TravelVisitWithPlaceModel>(
                  builder: (context, accepted, rejected) => Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                  onMove: (detail) => scrollDown(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void scrollUp() {
    scrollController.animateTo(scrollController.offset - 210.0,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void scrollDown() {
    scrollController.animateTo(scrollController.offset + 210.0,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }
}
