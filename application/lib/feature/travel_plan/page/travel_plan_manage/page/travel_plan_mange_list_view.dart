import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_list_drag_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_list_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_date_view.dart';
import 'package:application_new/shared/component/fixed_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanMangeListView extends ConsumerStatefulWidget {
  final List<TravelVisitWithPlaceModel> visitPlaces;

  const TravelPlanMangeListView({super.key, required this.visitPlaces});

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

    return Stack(
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
                              order: index, visitPlace: candidateData.first!)),
                    TravelPlanListItem(order: index, visitPlace: visitPlace),
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
