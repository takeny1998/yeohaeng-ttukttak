import 'package:application_new/common/event/event.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/feature/geography_select/geography_select_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_state.dart';
import 'package:application_new/shared/component/safe_bottom_view.dart';
import 'package:application_new/shared/component/show_modal_content_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCitiesListSheet extends ConsumerWidget {
  final ProvinceCitySelectState state;

  const SelectedCitiesListSheet._({required this.state});

  static Future<void> showSheet(
    BuildContext context, {
    required ProvinceCitySelectState state,
  }) =>  showModalContentSheet(
          context, SelectedCitiesListSheet._(state: state));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProvinceCitySelectState(:selectedCities) = state;
    final colorScheme = Theme.of(context).colorScheme;

    final tr = ref.watch(translationServiceProvider);

    final isAnyCitySelected = selectedCities.length > 0;

    return Scaffold(
      body: isAnyCitySelected
          ? ListView.builder(
              padding: const EdgeInsets.only(bottom: 24.0),
              physics: const ClampingScrollPhysics(),
              itemCount: selectedCities.length,
              itemBuilder: (context, index) {
                final cityRef = selectedCities.get(index);

                return ListTile(
                  onTap: () {
                    final notifier =
                        ref.read(provinceCitySelectProvider.notifier);
                    final childNotifier = ref.read(
                        geographySelectProvider(cityRef.reference.id).notifier);

                    childNotifier.active(cityRef.entity);
                    notifier.selectProvince(cityRef.reference);

                    Navigator.of(context).pop();
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
                  leading: CircleAvatar(
                    radius: 16.0,
                    backgroundColor: colorScheme.surfaceContainer,
                    child: Text('${index + 1}',
                        style: const TextStyle(fontWeight: FontWeight.w800)),
                  ),
                  title: Text(
                    cityRef.entity.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(cityRef.reference.name),
                  trailing: IconButton(
                      onPressed: () {
                        final notifier =
                            ref.read(provinceCitySelectProvider.notifier);

                        notifier.selectCity(cityRef.entity);
                        notifier.selectProvince(null);

                        eventController.add(MessageEvent(tr.from(
                            '{} has been deselected.',
                            args: [cityRef.entity.name])));

                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                          color: colorScheme.error, Icons.delete_outlined)),
                );
              },
            )
          : Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(24.0),
              child: Text(
                tr.from("You haven't selected any cities yet."),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 16.0),
              )),
      bottomNavigationBar: SafeBottomView(
          child: FilledButton(
              onPressed: Navigator.of(context).pop,
              child: Text(tr.from('Close')))),
    );
  }
}
