import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
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
  final PageController pageController = PageController();

  ProvinceCitySelectView({super.key, required this.countryId});

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
      :activeProvince,
    ) = state;

    final colorScheme = Theme.of(context).colorScheme;
    final badgeLabelStyle = TextStyle(
      color: colorScheme.onPrimary,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    );

    ref.listen(provinceCitySelectProvider, (prev, next) {
      final changedCity = (next.selectedCities.mapToEntity().toSet())
          .difference((prev?.selectedCities.mapToEntity().toSet() ?? {}))
          .firstOrNull;

      if (changedCity != null) {
        eventController.add(MessageEvent(
            tr.from('{} has been selected.', args: [changedCity.name]),
            onActionRef: Reference(
                entity: tr.from('View'),
                reference: () {
                  SelectedCitiesListSheet.showSheet(context, state: next);
                })));
      }

      if (prev?.selectProvince != next.selectProvince) {
        if (next.selectProvince != null) {
          nextPage();
        } else {
          previousPage();
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          selectProvince == null
              ? tr.from('Please select a province.')
              : selectProvince.name,
          style: const TextStyle(fontSize: 20.0),
        ),
        shape: const Border(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton.filledTonal(
                onPressed: () =>
                    SelectedCitiesListSheet.showSheet(context, state: state),
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
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                    onSelect: (model) {
                      final notifier =
                          ref.read(provinceCitySelectProvider.notifier);

                      model.mapOrNull(province: (province) {
                        notifier.activeProvince(province);
                        notifier.selectProvince(province);
                      });
                    }),
                SizedBox(
                  child: selectProvince != null
                      ? GeographySelectView(
                          selectedChildren: selectedCities.mapToEntity(),
                          id: selectProvince.id,
                          onSelect: (model) => model.mapOrNull(
                              city: (city) => ref
                                  .read(provinceCitySelectProvider.notifier)
                                  .selectCity(city)),
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
        ],
      ),
    );
  }
}
