import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/geography_select/geography_select_provider.dart';
import 'package:application_new/feature/geography_select/geography_select_view.dart';
import 'package:application_new/feature/geography_select/province_city_select_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_state.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    final ProvinceCitySelectState(:selectedCities, :selectedProvinceId) =
        ref.watch(provinceCitySelectProvider);

    final Iterable<int> idSet = selectedCities.map((city) => city.parentId);

    final geographies = ref.watch(geographiesProvider).value;

    final selectedProvinces = geographies
            ?.where((geography) => idSet.contains(geography.id))
            .toList() ??
        [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 24.0),
            Consumer(builder: (context, ref, child) {
              const textStyle =
                  TextStyle(fontWeight: FontWeight.w800, fontSize: 21.0);

              if (selectedProvinceId == null) {
                return Text(tr.from('Please select a province.'),
                    style: textStyle);
              }

              final province =
                  ref.watch(provinceProvider(selectedProvinceId)).value;

              return Text(province?.name ?? '', style: textStyle);
            }),
            const Expanded(child: SizedBox(width: 8.0)),
            IconButton.filledTonal(
                onPressed: () {},
                icon: Badge(
                    isLabelVisible: true,
                    label: Text('${selectedCities.length}'),
                    offset: const Offset(12.0, -8.0),
                    backgroundColor: Theme.of(context).colorScheme.primary,
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
                  selectedChildren: selectedProvinces,
                  isUnSelectable: false,
                  onSelect: (model) {
                    ref
                        .read(provinceCitySelectProvider.notifier)
                        .selectProvince(model.id);
                    nextPage();
                  }),
              SizedBox(
                child: selectedProvinceId != null
                    ? GeographySelectView(
                        selectedChildren: selectedCities,
                        id: selectedProvinceId,
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
