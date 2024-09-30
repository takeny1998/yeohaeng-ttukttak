import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel/component/bottom_action_button.dart';
import 'package:application_new/feature/travel/provider/create_travel_provider.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectTravelDateForm extends ConsumerWidget {
  const SelectTravelDateForm({super.key});

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

    final nights = areSelected
        ? DateTimeRange(start: startedOn, end: endedOn).duration.inDays
        : 0;

    final trKey = baseKey('travel.select_date');

    final buttonTextStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
            child: Text(trKey('ask_date'),
                    style: textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600))
                .tr(),
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
            final [startedOn, endedOn] = dates;
            ref
                .read(createTravelProvider.notifier)
                .selectDate(startedOn, endedOn);
          },
        ),
      ),
      bottomNavigationBar: BottomActionButton(
          onPressed: areSelected
              ? () => ref.read(createTravelProvider.notifier).nextPage()
              : null,
          child: areSelected
              ? Text(
                  trKey('display_select_date'),
                  style: buttonTextStyle,
                ).tr(namedArgs: {
                  'start': rangeFormat.format(startedOn),
                  'end': rangeFormat.format(endedOn),
                  'nights': '$nights',
                  'days': '${nights + 1}',
                })
              : Text(
                  trKey('require_date'),
                  style: buttonTextStyle,
                ).tr()),
    );
  }
}
