import 'package:application_new/feature/travel/create_travel_provider.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreateTravelPage extends ConsumerWidget {
  const CreateTravelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createTravelProvider);
    final startedOn = state.startedOn;
    final endedOn = state.endedOn;

    final firstDate = DateTime.now();
    final lastDate = firstDate.add(const Duration(days: 365));

    final areSelected = startedOn != null && endedOn != null;

    final textTheme = Theme.of(context).textTheme;
    final rangeFormat = DateFormat('yy.M.d');

    final days = areSelected
        ? DateTimeRange(start: startedOn, end: endedOn).duration.inDays
        : 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        scrolledUnderElevation: 0,
        shape: Border(
            bottom: BorderSide(color: Theme.of(context).colorScheme.secondary)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
            child: Text('언제 여행을 떠나시나요?',
                style: textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600)),
          ),
        ),
      ),
      body: SafeArea(
        child: CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            firstDate: firstDate,
            lastDate: lastDate,
            calendarType: CalendarDatePicker2Type.range,
            calendarViewMode: CalendarDatePicker2Mode.scroll,
            hideScrollViewTopHeader: true,
          ),
          value: [startedOn, endedOn],
          onValueChanged: (dates) {
            if (dates.length < 2) return;
            ref
                .read(createTravelProvider.notifier)
                .inputDate(dates[0], dates[1]);
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: FilledButton(
            style: FilledButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)))),
            onPressed: areSelected ? () {} : null,
            child: Text(
                areSelected
                    ? '${rangeFormat.format(startedOn)} - ${rangeFormat.format(endedOn)} ($days박 ${days + 1}일)'
                    : '날자를 선택하세요',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
