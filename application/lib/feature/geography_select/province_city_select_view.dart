import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/geography_select/geography_select_view.dart';
import 'package:application_new/feature/geography_select/province_city_select_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_state.dart';
import 'package:application_new/feature/geography_select/selected_cities_list_sheet.dart';
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

    final ProvinceCitySelectState(:selectedCities, :activeProvince) = state;

    final colorScheme = Theme.of(context).colorScheme;
    final badgeLabelStyle = TextStyle(
      color: colorScheme.onPrimary,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    );

    ref.listen(provinceCitySelectProvider, (prev, next) {
      if (prev?.selectedCities == next.selectedCities) return;

      SelectedCitiesListSheet.showSheet(context, state: next);
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 24.0),
            Consumer(builder: (context, ref, child) {
              const textStyle =
                  TextStyle(fontWeight: FontWeight.w800, fontSize: 21.0);

              if (activeProvince == null) {
                return Text(tr.from('Please select a province.'),
                    style: textStyle);
              }

              final province =
                  ref.watch(provinceProvider(activeProvince.id)).value;

              return Text(province?.name ?? '', style: textStyle);
            }),
            const Expanded(child: SizedBox(width: 8.0)),
            IconButton.filledTonal(
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
                  onSelect: (model) {
                    model.mapOrNull(province: (province) =>
                        ref
                            .read(provinceCitySelectProvider.notifier)
                            .activeProvince(province));
                    nextPage();
                  }),
              SizedBox(
                child: activeProvince != null
                    ? GeographySelectView(
                        selectedChildren: selectedCities.mapToEntity(),
                        id: activeProvince.id,
                        onSelect: (model) => model.mapOrNull(
                            city: (city) => ref
                                .read(provinceCitySelectProvider.notifier)
                                .selectCity(city)),
                        onCancel: () {
                          previousPage();
                        },
                      )
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
