import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_create/component/bottom_action_button.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:application_new/shared/component/filled_chip_theme.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/travel_create_provider.dart';

class SelectTravelDetailForm extends ConsumerWidget {
  const SelectTravelDetailForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final titleStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    final subTitleStyle =
        textTheme.labelLarge?.copyWith(color: colorScheme.secondary);

    final state = ref.watch(travelCreateProvider);

    final trKey = baseKey('travel.select_detail');

    final areSelected = state.companion != null && state.motivations.isNotEmpty;

    final buttonTextStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return FilledChipTheme(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(trKey('ask_companion'), style: titleStyle).tr(),
              Text(trKey('hint_companion'), style: subTitleStyle).tr(),
              const SizedBox(height: 16),
              Wrap(
                spacing: 6,
                children: [
                  for (TravelCompanionType companion in TravelCompanionType.values)
                    ChoiceChip(
                      label: Text(enumKey(companion)).tr(),
                      selected: state.companion == companion,
                      onSelected: (isSelected) {
                        if (!isSelected) return;
                        final notifier = ref.read(travelCreateProvider.notifier);
                        notifier.selectCompanion(companion);
                      },
                    ),
                ],
              ),
              const SizedBox(height: 48),
              Text(trKey('ask_motivation'), style: titleStyle).tr(),
              Text(trKey('hint_motivation'), style: subTitleStyle).tr(),
              const SizedBox(height: 16),
              Wrap(
                spacing: 6,
                children: [
                  for (TravelMotivation motivation in TravelMotivation.values)
                    FilterChip(
                      label: Text(enumKey(motivation)).tr(),
                      selected: state.motivations.contains(motivation),
                      onSelected: (_) {
                        final notifier = ref.read(travelCreateProvider.notifier);
                        notifier.selectMotivation(motivation);
                      },
                    ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomActionButton(
          onPressed:
              areSelected ? () => ref.read(travelCreateProvider.notifier).nextPage() : null,
          child: Text(
            areSelected ? 'next' : trKey('require_detail'),
            style: buttonTextStyle,
          ).tr(),
        ),
      ),
    );
  }
}