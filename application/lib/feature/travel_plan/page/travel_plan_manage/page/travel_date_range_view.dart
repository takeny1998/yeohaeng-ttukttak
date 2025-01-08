import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_date_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TravelDateRangeView extends ConsumerWidget {
  final TravelModel travel;
  final DateTime? selectedDate;
  final void Function(DateTime date) onChangeDate;
  final Widget Function(TravelDateItem item, int index)? builder;

  const TravelDateRangeView({
    super.key,
    required this.travel,
    required this.onChangeDate,
    this.builder,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final daysOfTravel =
        DateTimeRange(start: travel.startedOn, end: travel.endedOn)
            .duration
            .inDays;

    final builder = this.builder ?? (TravelDateItem item, int index) => item;

    return StatefulBuilder(builder: (context, setState) {

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(width: 24.0),
          for (int i = 0; i < daysOfTravel; i++) ...[
            builder(TravelDateItem(
                dayOfTravel: i,
                travel: travel,
                selectedDate: selectedDate,
                onChangeDate: onChangeDate), i),
            const SizedBox(width: 12.0),
          ],
          const SizedBox(width: 16.0),
        ]),
      );

    });
  }
}