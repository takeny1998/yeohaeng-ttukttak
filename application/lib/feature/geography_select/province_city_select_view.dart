import 'package:application_new/core/translation/translation_service.dart';
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
    final ProvinceCitySelectState(:selectedProvinceId) =
        ref.watch(provinceCitySelectProvider);

    final tr = ref.watch(translationServiceProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(
            key: ValueKey<int?>(selectedProvinceId),
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Consumer(builder: (context, ref, child) {
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
          ),
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              GeographySelectView(
                  id: 0,
                  onSelect: (id) {
                    ref
                        .read(provinceCitySelectProvider.notifier)
                        .selectProvince(id);
                    nextPage();
                  }),
              SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: selectedProvinceId != null
                    ? GeographySelectView(
                        id: selectedProvinceId,
                        onSelect: (id) {
                          ref
                              .read(provinceCitySelectProvider.notifier)
                              .selectCity(id);
                        },
                        onCancel: () {
                          ref
                              .read(provinceCitySelectProvider.notifier)
                              .selectCity(null);
                          ref
                              .read(provinceCitySelectProvider.notifier)
                              .selectProvince(null);
                          previousPage();
                        },
                      )
                    : null,
              )
            ],
          ),
        ),
      ],
    );
  }
}
