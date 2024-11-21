import 'dart:math';

import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_date_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_list_drag_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_list_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_date_range_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_provider.dart';
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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    var travel = widget.travel;
    var visitPlaces = widget.visitPlaces;

    final daysOfTravel = DateTimeRange(
      start: travel.startedOn,
      end: travel.endedOn,
    ).duration.inDays;

    ref.listen(travelPlanManageProvider(travel.id), (prev, next) {
      if (prev?.selectedDate == next?.selectedDate) return;
      scrollController.jumpTo(0.0);
    });

    return Stack(
      children: [
        Positioned.fill(
            child: CustomScrollView(
                physics: const ClampingScrollPhysics(),
                controller: scrollController,
                slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
              SliverList.builder(
                  itemCount: visitPlaces.length,
                  itemBuilder: (context, index) {
                    final visitPlace = visitPlaces[index];

                    return DragTarget<TravelVisitWithPlaceModel>(
                        onAcceptWithDetails: (detail) => ref
                            .read(travelPlanManageProvider(travel.id)
                                .notifier)
                            .move(detail.data,
                                visitPlace.visit.orderOfVisit),
                        builder: (context, candidateData, rejectedData) {
                          return Column(
                            children: [
                              if (candidateData.isNotEmpty)
                                Opacity(
                                    opacity: 0.5,
                                    child: TravelPlanListItem(
                                        order: index,
                                        visitPlace:
                                            candidateData.first!)),
                              TravelPlanListItem(
                                  onDelete: () => ref
                                      .read(travelPlanManageProvider(
                                              travel.id)
                                          .notifier)
                                      .delete(visitPlace),
                                  order: index,
                                  visitPlace: visitPlace),
                            ],
                          );
                        });
                  }),
              SliverFillRemaining(
                hasScrollBody: false,
                child: DragTarget<TravelVisitWithPlaceModel>(
                    onAcceptWithDetails: (detail) {
                  var lastVisit = visitPlaces.lastOrNull?.visit;
                  ref
                      .read(travelPlanManageProvider(travel.id).notifier)
                      .move(detail.data,
                          (lastVisit?.orderOfVisit ?? -1) + 1);
                }, builder: (context, candidateData, rejectedData) {
                  return Column(
                    children: [
                      if (candidateData.isNotEmpty)
                        Opacity(
                            opacity: 0.5,
                            child: TravelPlanListItem(
                                order: 0,
                                visitPlace: candidateData.first!)),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          constraints:
                              const BoxConstraints(minHeight: 128.0),
                          child: Row(
                            children: [
                              const SizedBox(width: 24.0),
                              SizedBox(
                                width: 32.0,
                                child: Column(
                                  children: [
                                    if (visitPlaces.isEmpty)
                                      CircleAvatar(
                                        radius: 16.0,
                                        child: Icon(
                                            Icons
                                                .add_location_alt_outlined,
                                            color: colorScheme.primary,
                                            size: 18.0),
                                      ),
                                    Expanded(
                                      child: Container(
                                        width: 1.0,
                                        color:
                                            colorScheme.primaryContainer,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
              )
            ])),
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
