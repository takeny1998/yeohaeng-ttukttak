import 'package:application_new/common/util/date_util.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:flutter/material.dart';

class TravelDateItem extends StatelessWidget {
  final int dayOfTravel;
  final TravelModel travel;
  final DateTime? selectedDate;
  final void Function(DateTime date) onChangeDate;

  const TravelDateItem(
      {super.key,
      required this.dayOfTravel,
      required this.travel,
      required this.selectedDate,
      required this.onChangeDate});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme) = Theme.of(context);
    final date = travel.startedOn.add(Duration(days: dayOfTravel));
    final isInTravelDate = DateUtil.isInRange(
      date,
      travel.startedOn,
      travel.endedOn,
    );

    final color = (date.weekday == 7)
        ? Colors.red
        : ((date.weekday == 6) ? Colors.blue : null);

    final isToday = DateUtils.isSameDay(DateTime.now(), date);
    final isSelected = DateUtils.isSameDay(selectedDate, date);

    final weekDayLabelStyle = TextStyle(
        fontSize: 12.0,
        height: 1.0,
        color: isInTravelDate ? color : colorScheme.surfaceDim);

    final dateLabelStyle = TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: isInTravelDate
            ? (isSelected ? colorScheme.primary : colorScheme.onSurface)
            : colorScheme.surfaceDim);

    return Column(
      children: [
        Text(DateUtil.formatter('EEEE').date(date), style: weekDayLabelStyle),
        const SizedBox(height: 2.0),
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: isSelected
                  ? colorScheme.primaryContainer
                  : colorScheme.surfaceContainer,
              padding: const EdgeInsets.all(12.0),
              visualDensity: VisualDensity.compact),
          splashColor: isInTravelDate ? colorScheme.primaryFixedDim : null,
          onPressed: isInTravelDate ? () => onChangeDate(date) : null,
          icon: Text(DateUtil.formatter('MMMd').date(date),
              style: dateLabelStyle),
        )
      ],
    );
  }
}
