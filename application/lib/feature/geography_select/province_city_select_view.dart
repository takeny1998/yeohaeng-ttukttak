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
import 'package:application_new/shared/component/content_top_app_bar.dart';
import 'package:application_new/shared/dto/reference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badges;

class ProvinceCitySelectView extends ConsumerWidget {
  final int countryId;

  ProvinceCitySelectView(
      {super.key, required this.countryId});

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

    final ColorScheme(:onPrimary, :primary, :surfaceContainerHighest) = Theme.of(context).colorScheme;
    final badgeLabelStyle = TextStyle(
      color: onPrimary,
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
                      SelectedCitiesListSheet.showSheet(context, state: next);
                    })));
      }
    });

    return Scaffold(
      appBar: AppBar(
        shape: const Border(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ContentTopAppBar(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectProvince == null
                    ? tr.from('Please select a province.')
                    : selectProvince.name,
                style:
                const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              IconButton.filledTonal(
                  onPressed: () => SelectedCitiesListSheet.showSheet(context, state: state),
                  icon: badges.Badge(
                      badgeAnimation: const badges.BadgeAnimation.scale(),
                      position:
                      badges.BadgePosition.topEnd(top: -16.0, end: -12.0),
                      badgeContent: Text('${selectedCities.length}',
                          style: badgeLabelStyle),
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: primary,
                        padding: const EdgeInsets.all(6.0),
                      ),
                      child: const Icon(Icons.shopping_cart_outlined))),
            ],
          )),
          const SizedBox(height: 16.0),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                GeographySelectView(
                    id: countryId,
                    selectedChildren: selectedCities.mapToReference(),
                    onSelect: (model) {
                      final notifier =
                      ref.read(provinceCitySelectProvider.notifier);
                      model.mapOrNull(province: (province) {
                        notifier.selectProvince(province);
                        nextPage();
                      });
                    }),
                SizedBox(
                  child: isProvinceSelected
                      ? GeographySelectView(
                    selectedChildren: selectedCities.mapToEntity(),
                    id: selectProvince.id,
                    onSelect: (geography) => geography.mapOrNull(
                        city: (city) => ref
                            .read(provinceCitySelectProvider.notifier)
                            .selectCity(city)),
                  )
                      : const SizedBox(),
                )
              ],
            ),
          ),
          Center(
              child: OutlinedButton(
                  onPressed: isProvinceSelected
                      ? () {
                    ref
                        .read(provinceCitySelectProvider.notifier)
                        .selectProvince(null);
                    previousPage();
                  }
                      : null,
                  child:
                  Text(tr.from('Back to the page')))),

          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
