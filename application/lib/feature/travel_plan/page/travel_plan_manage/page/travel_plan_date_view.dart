import 'package:application_new/common/util/date_util.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_date_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanDateView extends ConsumerStatefulWidget {
  final TravelModel travel;
  final DateTime? selectedDate;
  final void Function(DateTime date) onChangeDate;

  const TravelPlanDateView({
    super.key,
    required this.travel,
    required this.onChangeDate,
    this.selectedDate,
  });

  @override
  ConsumerState createState() => _TravelPlanDateViewState();
}

class _TravelPlanDateViewState extends ConsumerState<TravelPlanDateView> {
  final ScrollController scrollController = ScrollController();
  static const dateWidgetWidth = 48.0;

  late final int daysOfMonth;
  late final DateTime firstDayOfMonth;

  late final DateTimeRange travelDateRange;

  @override
  void initState() {
    super.initState();

    final startedOn = widget.travel.startedOn;

    firstDayOfMonth = DateTime(startedOn.year, startedOn.month);
    daysOfMonth = DateUtils.getDaysInMonth(startedOn.year, startedOn.month);

    Future.microtask(() {
      final initialOffset =
          startedOn.difference(firstDayOfMonth).inDays * dateWidgetWidth;

      scrollController.jumpTo(initialOffset);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final travel = widget.travel;

    final daysOfTravel =
        DateTimeRange(start: travel.startedOn, end: travel.endedOn)
            .duration
            .inDays;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(width: 16.0),
        for (int i = 0; i < daysOfTravel; i++) ...[
          TravelDateItem(
              dayOfTravel: i,
              travel: travel,
              selectedDate: widget.selectedDate,
              onChangeDate: widget.onChangeDate),
          const SizedBox(width: 8.0),
        ],
        const SizedBox(width: 16.0),
      ]),
    );
  }
}
