import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/core/message/message_util.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/geography_select/geography_select_provider.dart';
import 'package:application_new/feature/geography_select/geography_select_view.dart';
import 'package:application_new/feature/geography_select/province_city_select_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_state.dart';
import 'package:application_new/feature/geography_select/selected_cities_list_sheet.dart';
import 'package:application_new/shared/dto/reference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badges;

class ProvinceCitySelectView extends ConsumerWidget {
  final int countryId;
  final void Function(List<CityModel> selectedCities) onConfirm;

  ProvinceCitySelectView(
      {super.key, required this.countryId, required this.onConfirm});

  final PageController pageController = PageController();

  void previousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = ref.watch(translationServiceProvider);

    final state = ref.watch(provinceCitySelectProvider);

    final ProvinceCitySelectState(
      :selectProvince,
      :selectedCities,
    ) = state;

    final colorScheme = Theme.of(context).colorScheme;
    final badgeLabelStyle = TextStyle(
      color: colorScheme.onPrimary,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    );

    ref.listen(provinceCitySelectProvider, (prev, next) {
      if (prev?.selectProvince != next.selectProvince) {
        if (next.selectProvince != null) {
          nextPage();
        } else {
          previousPage();
        }
      }
    });

    final isProvinceSelected = selectProvince != null;

    final ProvinceModel? activeProvince = ref
        .watch(geographySelectProvider(0))
        .value
        ?.activeChild
        ?.mapOrNull(province: (e) => e);

    final CityModel? activeCity = isProvinceSelected
        ? ref
            .watch(geographySelectProvider(selectProvince.id))
            .value
            ?.activeChild
            ?.mapOrNull(city: (e) => e)
        : null;


    return ScaffoldMessenger(
      child: Scaffold(
        body: Consumer(builder: (context, ref, child) {
          ref.listen(provinceCitySelectProvider, (prev, next) {
            final changedCity = (next.selectedCities.mapToEntity().toSet())
                .difference((prev?.selectedCities.mapToEntity().toSet() ?? {}))
                .firstOrNull;
        
            if (changedCity != null) {
              MessageUtil.showSnackBar(
                  context,
                  MessageEvent(
                      tr.from('{} has been selected.', args: [changedCity.name]),
                      onActionRef: Reference(
                          entity: tr.from('View'),
                          reference: () {
                            SelectedCitiesListSheet.showSheet(context,
                                state: next, onConfirm: onConfirm);
                          })));
            }
          });
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 24.0),
                  Text(
                    selectProvince == null
                        ? tr.from('Please select a province.')
                        : selectProvince.name,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  const Expanded(child: SizedBox(width: 8.0)),
                  IconButton.filledTonal(
                      onPressed: () => SelectedCitiesListSheet.showSheet(context,
                          state: state, onConfirm: onConfirm),
                      icon: badges.Badge(
                          badgeAnimation: const badges.BadgeAnimation.scale(),
                          position:
                              badges.BadgePosition.topEnd(top: -16.0, end: -12.0),
                          badgeContent: Text('${selectedCities.length}',
                              style: badgeLabelStyle),
                          badgeStyle: badges.BadgeStyle(
                            badgeColor: colorScheme.primary,
                            padding: const EdgeInsets.all(6.0),
                          ),
                          child: const Icon(Icons.shopping_cart_outlined))),
                  const SizedBox(width: 24.0),
                ],
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    GeographySelectView(
                        id: countryId,
                        selectedChildren: selectedCities.mapToReference(),
                        isUnSelectable: false,
                        onSelect: (model, _) {
                          final notifier =
                              ref.read(provinceCitySelectProvider.notifier);
                          model.mapOrNull(province: (province) {
                            notifier.selectProvince(province);
                          });
                        }),
                    SizedBox(
                      child: isProvinceSelected
                          ? GeographySelectView(
                              selectedChildren: selectedCities.mapToEntity(),
                              id: selectProvince.id,
                              onSelect: (model, context) =>
                                  model.mapOrNull(city: (city) {
                                if (!selectedCities.contains(city)) {}
        
                                ref
                                    .read(provinceCitySelectProvider.notifier)
                                    .selectCity(city);
                                return null;
                              }),
                              onCancel: () {
                                ref
                                    .read(provinceCitySelectProvider.notifier)
                                    .selectProvince(null);
                              },
                            )
                          : const SizedBox(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
            ],
          );
        }),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: colorScheme.surfaceContainerHighest))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: OutlinedButton(
                      onPressed: isProvinceSelected
                          ? () {
                              ref
                                  .read(provinceCitySelectProvider.notifier)
                                  .selectProvince(null);
                              previousPage();
                            }
                          : null,
                      child: Text(tr.from('Cancel')))),
              const SizedBox(width: 8.0),
              Expanded(
                  child: FilledButton(
                      onPressed: () {
                        final notifier =
                            ref.read(provinceCitySelectProvider.notifier);
      
                        if (!isProvinceSelected) {
                          notifier.selectProvince(activeProvince);
                          return nextPage();
                        }
      
                        if (activeCity == null) return;
      
                        notifier.selectCity(activeCity);
                      },
                      child: Text(activeCity != null &&
                              selectedCities.contains(activeCity) &&
                              isProvinceSelected
                          ? tr.from('Unselect')
                          : tr.from('Select')))),
            ],
          ),
        ),
      ),
    );
  }
}
