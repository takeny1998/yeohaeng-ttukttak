import 'package:application_new/domain/travel/travel_plan/travel_plan_model.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_list_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanMangeListView extends ConsumerStatefulWidget {
  final List<TravelPlanModel> plans;
  final TravelPlanManageProvider provider;

  final Function(DateTime) onChangeDate;

  const TravelPlanMangeListView({
    super.key,
    required this.plans,
    required this.provider,
    required this.onChangeDate,
  });

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

    ref.listen(widget.provider, (prev, next) {
      if (prev?.selectedDate == next?.selectedDate) return;
      scrollController.jumpTo(0.0);
    });

    final plans = widget.plans;

    return Stack(
      children: [
        Positioned.fill(
            child: CustomScrollView(
                physics: const ClampingScrollPhysics(),
                controller: scrollController,
                slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
              SliverList.builder(
                  itemCount: plans.length,
                  itemBuilder: (context, index) {
                    final plan = plans[index];

                    return DragTarget<TravelPlanModel>(
                        onAcceptWithDetails: (detail) => ref
                            .read(widget.provider.notifier)
                            .move(detail.data, plan.orderOfVisit),
                        builder: (context, candidateData, rejectedData) {
                          return Column(
                            children: [
                              if (candidateData.isNotEmpty)
                                Opacity(
                                    opacity: 0.5,
                                    child: TravelPlanListItem(
                                        order: index,
                                       plan: candidateData.first!)),
                              TravelPlanListItem(
                                  onDelete: () => ref
                                      .read(widget.provider.notifier)
                                      .delete(plan),
                                  order: index,
                                  plan: plan),
                            ],
                          );
                        });
                  }),
              SliverFillRemaining(
                hasScrollBody: false,
                child: DragTarget<TravelPlanModel>(
                    onAcceptWithDetails: (detail) {
                  final lastPlan = plans.lastOrNull;
                  ref
                      .read(widget.provider.notifier)
                      .move(detail.data, (lastPlan?.orderOfVisit ?? -1) + 1);
                }, builder: (context, candidateData, rejectedData) {
                  return Column(
                    children: [
                      if (candidateData.isNotEmpty)
                        Opacity(
                            opacity: 0.5,
                            child: TravelPlanListItem(
                                order: 0, plan: candidateData.first!)),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          constraints: const BoxConstraints(minHeight: 128.0),
                          child: Row(
                            children: [
                              const SizedBox(width: 24.0),
                              SizedBox(
                                width: 32.0,
                                child: Column(
                                  children: [
                                    if (plans.isEmpty)
                                      CircleAvatar(
                                        radius: 16.0,
                                        child: Icon(
                                            Icons.add_location_alt_outlined,
                                            color: colorScheme.primary,
                                            size: 18.0),
                                      ),
                                    Expanded(
                                      child: Container(
                                        width: 1.0,
                                        color: colorScheme.primaryContainer,
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
