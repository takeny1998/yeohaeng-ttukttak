import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_view.dart';
import 'package:application_new/feature/travel_create/component/bottom_action_button.dart';
import 'package:application_new/feature/travel_create/component/city_list_item.dart';
import 'package:application_new/feature/travel_create/component/selected_city_item.dart';
import 'package:application_new/feature/travel_create/component/travel_region_item.dart';
import 'package:application_new/feature/travel_create/delegate/city_search_delegate.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:application_new/shared/theme/my_chip_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/travel_create_provider.dart';

class SelectTravelCityForm extends ConsumerStatefulWidget {
  const SelectTravelCityForm({super.key});
  @override
  ConsumerState createState() => _SelectTravelCityFormState();
}

class _SelectTravelCityFormState extends ConsumerState<SelectTravelCityForm> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TravelCreateState(cities: selectedCities, region: selectedRegion) =
        ref.watch(travelCreateProvider);

    final colorScheme = Theme.of(context).colorScheme;

    final tr = ref.watch(translationServiceProvider);

    ref.listen(travelCreateProvider, (prev, next) {
      if (prev?.region == next.region) return;

      scrollController.animateTo(0.0,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    });


    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: SafeArea(child: ProvinceCitySelectView(countryId: 0, onConfirm: (selectedCities) {
          final notifier = ref.read(travelCreateProvider.notifier);
          notifier.selectCities(selectedCities);
          notifier.submit();
        })),
      )
    );
  }
}
