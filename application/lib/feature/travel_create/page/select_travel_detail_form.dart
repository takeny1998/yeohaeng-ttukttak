import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/feature/travel_create/component/bottom_action_button.dart';
import 'package:application_new/shared/theme/my_chip_theme.dart';
import 'package:application_new/domain/travel/travel_model.dart';
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

    final areSelected =
        state.companionTypes.isNotEmpty && state.motivationTypes.isNotEmpty;

    final buttonTextStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    final tr = ref.watch(translationServiceProvider);

    return MyChipTheme(
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
              Text(tr.from('Who will you travel with?'), style: titleStyle),
              Text(
                tr.from('(Select at least {}, up to {})',
                    args: ['1', '3']),
                style: subTitleStyle,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 6,
                children: [
                  for (TravelCompanionType companionType
                      in TravelCompanionType.values)
                    FilterChip(
                      label: Text(tr.fromEnum(companionType)),
                      selected: state.companionTypes.contains(companionType),
                      onSelected: (isSelected) {
                        final notifier =
                            ref.read(travelCreateProvider.notifier);
                        notifier.selectCompanionType(companionType);
                      },
                    ),
                ],
              ),
              const SizedBox(height: 48),
              Text(tr.from("What's the purpose of your trip?"), style: titleStyle),
              Text(
                  tr.from('(Select at least {}, up to {})',
                      args: ['1', '5']),
                  style: subTitleStyle),
              const SizedBox(height: 16),
              Wrap(
                spacing: 6,
                children: [
                  for (TravelMotivationType motivationType
                      in TravelMotivationType.values)
                    FilterChip(
                      label: Text(tr.fromEnum(motivationType)),
                      selected: state.motivationTypes.contains(motivationType),
                      onSelected: (_) {
                        final notifier =
                            ref.read(travelCreateProvider.notifier);
                        notifier.selectMotivationType(motivationType);
                      },
                    ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomActionButton(
          onPressed: areSelected
              ? ref.read(travelCreateProvider.notifier).nextPage
              : null,
          child: Text(
            areSelected
                ? tr.from('Next')
                : tr.from('Please check all of the boxes.'),
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
