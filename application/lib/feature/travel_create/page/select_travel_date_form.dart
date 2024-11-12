import 'package:application_new/common/util/date_util.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/feature/travel_create/component/bottom_action_button.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/travel_create_provider.dart';

class SelectTravelDateForm extends ConsumerWidget {
  const SelectTravelDateForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(travelCreateProvider);
    final startedOn = state.startedOn;
    final endedOn = state.endedOn;

    final firstDate = DateTime.now();
    final lastDate = firstDate.add(const Duration(days: 365));

    final areSelected = startedOn != null && endedOn != null;

    final textTheme = Theme.of(context).textTheme;

    final nights = areSelected
        ? DateTimeRange(start: startedOn, end: endedOn).duration.inDays
        : 0;

    final translator = TranslationUtil.widget(context);

    final dateFormatter = DateUtil.formatter('yy.m.d');

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
            child: Text(translator.key('ask_date'),
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
            final [startedOn, endedOn] = dates;
            ref
                .read(travelCreateProvider.notifier)
                .selectDate(startedOn, endedOn);
          },
        ),
      ),
      bottomNavigationBar: BottomActionButton(
          onPressed: areSelected
              ? ref.read(travelCreateProvider.notifier).nextPage
              : null,
          child: areSelected
              ? Text(
                  translator.plural('show_selected_date', nights, args: {
                    'start': dateFormatter.date(startedOn),
                    'end': dateFormatter.date(endedOn),
                    'days': '${nights + 1}'
                  }),
                  style: buttonTextStyle,
                )
              : Text(
                  translator.key('require_select_date'),
                  style: buttonTextStyle,
                )),
    );
  }
}
