import 'package:application_new/feature/geography_select/province_city_select_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_state.dart';
import 'package:application_new/feature/geography_select/province_city_select_view.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:application_new/shared/component/paged_form_bottom_control_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/travel_create_provider.dart';

class TravelCityForm extends ConsumerWidget {
  final PageController pageController;

  const TravelCityForm(this.pageController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TravelCreateState(:cities) = ref.watch(travelCreateProvider);

    return Scaffold(
      body: ScaffoldMessenger(
        child: ProvinceCitySelectView(countryId: 0)),
      bottomNavigationBar: PagedFormBottomControlView(
          isInputted: cities.isNotEmpty, controller: pageController),
    );
  }
}
