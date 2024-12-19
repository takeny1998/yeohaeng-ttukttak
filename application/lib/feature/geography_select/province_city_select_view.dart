import 'package:application_new/feature/geography_select/geography_select_provider.dart';
import 'package:application_new/feature/geography_select/geography_select_view.dart';
import 'package:application_new/feature/geography_select/province_city_select_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_state.dart';
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

    return Column(
      children: [
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
