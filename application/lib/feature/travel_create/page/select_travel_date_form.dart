import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/common/util/date_util.dart';
import 'package:application_new/feature/travel_create/component/bottom_action_button.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/travel_create_provider.dart';

class SelectTravelDateForm extends ConsumerWidget {
  const SelectTravelDateForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(travelCreateProvider);
    final TravelCreateState(:startedOn, :endedOn) = state;

    final firstDate = DateTime.now();
    final lastDate = firstDate.add(const Duration(days: 365));

    final areSelected = startedOn != null && endedOn != null;

    final textTheme = Theme.of(context).textTheme;
    final tr = ref.watch(translationServiceProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
            child: Text(tr.from('when_will_you_travel'),
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
          child: Text(formatLabel(tr, startedOn, endedOn))),
    );
  }

  String formatLabel(
      TranslationService tr, DateTime? startedOn, DateTime? endedOn) {
    final format = DateUtil.formatter('yy.m.d');

    if (startedOn != null && endedOn != null) {
      final nights = endedOn.difference(startedOn).inDays;

      if (nights == 0) {
        return tr.from('start_day_trip', args: [format.date(startedOn)]);
      }

      return tr.from('start_and_end_number_days',
          args: [format.date(startedOn), format.date(endedOn), '$nights']);
    }

    return tr.from('please_select_travel_period');
  }
}
