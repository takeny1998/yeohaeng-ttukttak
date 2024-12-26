import 'package:application_new/common/event/event.dart';
import 'package:application_new/core/message/message_util.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/feature/travel_create/component/bottom_action_button.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:application_new/shared/component/content_top_app_bar.dart';
import 'package:application_new/shared/component/paged_form_bottom_control_view.dart';
import 'package:application_new/shared/theme/my_chip_theme.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/travel_create_provider.dart';

class TravelCompanionTypeForm extends ConsumerWidget {
  final PageController pageController;

  const TravelCompanionTypeForm(this.pageController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme(:primaryContainer, :onSurface, :surface, :surfaceContainer) = Theme.of(context).colorScheme;

    const titleStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0);
    final TravelCreateState(:companionTypes) = ref.watch(travelCreateProvider);

    final tr = ref.watch(translationServiceProvider);

    return ScaffoldMessenger(
      child: Scaffold(
        backgroundColor: surface,
          appBar: AppBar(shape: const Border()),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContentTopAppBar(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(tr.from('Who will you travel with?'), style: titleStyle),
                    Text(tr.from('(Select at least {}, up to {})',
                        args: ['1', '3'])),
                    const SizedBox(height: 8.0),
                  ])),
              Expanded(
                  child: ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      itemCount: TravelCompanionType.values.length,
                      separatorBuilder: (context, index) {
                        final companionType = TravelCompanionType.values[index];
                        final isSelected = companionTypes.contains(companionType);

                        return Divider(
                            color: isSelected
                                ? primaryContainer
                                : surfaceContainer,
                            height: 1.0);
                      },
                      itemBuilder: (context, index) {
                        final companionType = TravelCompanionType.values[index];
                        final isSelected = companionTypes.contains(companionType);
                        return CheckboxListTile(
                            selectedTileColor: primaryContainer,
          
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 6.0),
                            value: isSelected,
                            selected: isSelected,
                            title: Text(tr.from('With ${companionType.name}'),
                                style: TextStyle(fontWeight: FontWeight.w600, color: onSurface)),
                            onChanged: (willSelect) {
                              if (companionTypes.length == 3 && (willSelect ?? false)) {
                                MessageUtil.showSnackBar(context, MessageEvent(tr.from(
                                  'You can select up to {}.', args: ['${3}'])));
                              }
                              ref
                                .read(travelCreateProvider.notifier)
                                .selectCompanionType(companionType);
                            });
                      })),
            ],
          ),
          bottomNavigationBar: PagedFormBottomControlView(
              isInputted: companionTypes.isNotEmpty, controller: pageController)),
    );
  }
}
