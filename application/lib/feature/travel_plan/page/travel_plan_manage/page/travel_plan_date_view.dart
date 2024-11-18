import 'package:application_new/common/util/date_util.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanDateView extends ConsumerWidget {
  final TravelModel travel;
  final DateTime selectedDate;
  final void Function(DateTime date) onChangeDate;

  const TravelPlanDateView({
    super.key,
    required this.travel,
    required this.selectedDate,
    required this.onChangeDate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final travelDate =
        DateTimeRange(start: travel.startedOn, end: travel.endedOn);
    final ThemeData(:colorScheme) = Theme.of(context);

    final dateFormat = DateUtil.formatter('yMMM');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(dateFormat.date(travel.startedOn),
                      style: const TextStyle(fontSize: 18.0)),
                  const Icon(Icons.arrow_drop_down),
                ],
              )),
        ),
        SizedBox(height: 6.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            const SizedBox(width: 24.0),
            for (int i = 0; i < 30; i++) ...[
              Builder(builder: (context) {
                final date = travel.startedOn.add(Duration(days: i));
                final isInTravelDate = DateUtil.isInRange(travelDate, date);

                final color = (date.weekday == 7)
                    ? Colors.red
                    : ((date.weekday == 6) ? Colors.blue : null);

                final isToday = DateUtils.isSameDay(DateTime.now(), date);
                final isSelected = DateUtils.isSameDay(selectedDate, date);

                final weekDayLabelStyle = TextStyle(
                    fontSize: 11.5,
                    height: 1.0,
                    color: isInTravelDate ? color : colorScheme.surfaceDim);

                final dateLabelStyle = TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: isInTravelDate
                        ? (isSelected
                            ? colorScheme.primary
                            : colorScheme.onSurface)
                        : colorScheme.surfaceDim);

                return Column(
                  children: [
                    Text(DateUtil.formatter('E').date(date),
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
                          isInTravelDate ? () => onChangeDate(date) : null,
                      icon: Text('${date.day}', style: dateLabelStyle),
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
        ),
      ],
    );
  }
}
