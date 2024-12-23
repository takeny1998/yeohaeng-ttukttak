import 'package:application_new/feature/geography_select/province_city_select_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_state.dart';
import 'package:application_new/feature/geography_select/province_city_select_view.dart';
import 'package:application_new/shared/component/paged_form_bottom_control_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/travel_create_provider.dart';

class SelectTravelCityForm extends ConsumerWidget {
  final PageController pageController;

  const SelectTravelCityForm(this.pageController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProvinceCitySelectState(:selectedCities) =
        ref.watch(provinceCitySelectProvider);

    return Scaffold(
      appBar: AppBar(),
      body: ScaffoldMessenger(
        child: ProvinceCitySelectView(
            countryId: 0,
            onConfirm: (selectedCities) {
            }),
      ),
      bottomNavigationBar: PagedFormBottomControlView(
          isInputted: selectedCities.length > 0, controller: pageController, onNextPage: () {

        final notifier = ref.read(travelCreateProvider.notifier);
        notifier.selectCities(selectedCities.mapToEntity().toList());
        notifier.submit();
      },),
    );
  }
}
