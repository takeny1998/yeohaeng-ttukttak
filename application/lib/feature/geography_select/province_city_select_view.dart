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

  void handleSelectSheet(
      BuildContext context,
      WidgetRef ref, ProvinceCitySelectState state) async {

    final reference = await SelectedCitiesListSheet.showSheet(context, state: state);

    if (reference == null) return;
    final notifier = ref.read(provinceCitySelectProvider.notifier);

    notifier.activeCity(reference.entity);
    notifier.activeProvince(reference.reference);
    nextPage();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = ref.watch(translationServiceProvider);

    final state = ref.watch(provinceCitySelectProvider);

    final ProvinceCitySelectState(
      :selectedCities,
      :activeProvince,
      :activeCity
    ) = state;

    final colorScheme = Theme.of(context).colorScheme;
    final badgeLabelStyle = TextStyle(
      color: colorScheme.onPrimary,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    );

    ref.listen(provinceCitySelectProvider, (prev, next) {
      final prevCityCount = prev?.selectedCities.length ?? 0;
      final cityCount = next.selectedCities.length;

      if (cityCount > prevCityCount) {
        handleSelectSheet(context, ref, next);
      }
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
                    handleSelectSheet(context, ref, state),
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
                  initialActiveChild: activeProvince,
                  isUnSelectable: false,
                  onSelect: (model) {
                    model.mapOrNull(
                        province: (province) => ref
                            .read(provinceCitySelectProvider.notifier)
                            .activeProvince(province));
                    nextPage();
                  }),
              SizedBox(
                child: activeProvince != null
                    ? GeographySelectView(
                        selectedChildren: selectedCities.mapToEntity(),
                        id: activeProvince.id,
                        initialActiveChild: activeCity,
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
