import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/common/util/date_util.dart';
import 'package:application_new/feature/travel_create/component/bottom_action_button.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:application_new/shared/component/paged_form_bottom_control_view.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/travel_create_provider.dart';

class SelectTravelDateForm extends ConsumerWidget {
  final PageController pageController;

  SelectTravelDateForm(this.pageController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(travelCreateProvider);
    final TravelCreateState(:startedOn, :endedOn) = state;

    final firstDate = DateTime.now();
    final lastDate = firstDate.add(const Duration(days: 365));

    final isDateSelected = startedOn != null && endedOn != null;

    final ColorScheme(:surfaceContainerHighest) = Theme.of(context).colorScheme;
    final tr = ref.watch(translationServiceProvider);

    return Scaffold(
      appBar: AppBar(shape: const Border()),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 16.0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: surfaceContainerHighest))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr.from('When will you travel?'),
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                Text(formatInputtedDate(tr, startedOn, endedOn))
              ],),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  scrollViewController: ScrollController(),
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
          ),
        ],
      ),
      bottomNavigationBar: PagedFormBottomControlView(
        hasPreviousPage: false,
          controller: pageController, isInputted: isDateSelected),
    );
  }

  String formatInputtedDate(
      TranslationService tr, DateTime? startedOn, DateTime? endedOn) {
    final format = DateUtil.formatter('yy.MM.d');

    if (startedOn != null && endedOn != null) {
      final nights = endedOn.difference(startedOn).inDays;

      if (nights == 0) {
        return tr.from('{} (day trip)', args: [format.date(startedOn)]);
      }

      return tr.from('{} - {} ({} days)', args: [
        format.date(startedOn),
        format.date(endedOn),
        '$nights',
        '${nights + 1}'
      ]);
    }

    return tr.from('Please select a travel period');
  }
}
