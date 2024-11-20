import 'package:application_new/common/util/date_util.dart';
import 'package:application_new/domain/travel/travel_model.dart';
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
    final ThemeData(:colorScheme) = Theme.of(context);

    final daysOfTravel =
        DateTimeRange(start: travel.startedOn, end: travel.endedOn)
            .duration
            .inDays;

    final dateFormat = DateUtil.formatter('yMMM');

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        const SizedBox(width: 16.0),
        for (int i = 0; i < daysOfTravel; i++) ...[
          Builder(builder: (context) {
            final date = travel.startedOn.add(Duration(days: i));
            final isInTravelDate =
                DateUtil.isInRange(date, travel.startedOn, travel.endedOn);

            final color = (date.weekday == 7)
                ? Colors.red
                : ((date.weekday == 6) ? Colors.blue : null);

            final isToday = DateUtils.isSameDay(DateTime.now(), date);
            final isSelected = DateUtils.isSameDay(widget.selectedDate, date);

            final weekDayLabelStyle = TextStyle(
                fontSize: 11.5,
                height: 1.0,
                color: isInTravelDate ? color : colorScheme.surfaceDim);

            final dateLabelStyle = TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: isInTravelDate
                    ? (isSelected ? colorScheme.primary : colorScheme.onSurface)
                    : colorScheme.surfaceDim);

            return Column(
              children: [
                Text(DateUtil.formatter('EEEE').date(date),
                    style: weekDayLabelStyle),
                const SizedBox(height: 2.0),
                IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: isSelected
                          ? colorScheme.primaryContainer
                          : colorScheme.surfaceContainer,
                      padding: const EdgeInsets.all(12.0),
                      visualDensity: VisualDensity.compact),
                  splashColor:
                      isInTravelDate ? colorScheme.primaryFixedDim : null,
                  onPressed:
                      isInTravelDate ? () => widget.onChangeDate(date) : null,
                  icon: Text(DateUtil.formatter('MMMd').date(date),
                      style: dateLabelStyle),
                ),
                CircleAvatar(
                  radius: 3.0,
                  backgroundColor:
                      isToday ? colorScheme.primary : Colors.transparent,
                )
              ],
            );
          }),
          const SizedBox(width: 8.0),
        ],
        const SizedBox(width: 16.0),
      ]),
    );
  }
}
