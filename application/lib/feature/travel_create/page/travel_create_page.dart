import 'package:application_new/common/event/event.dart';
import 'package:application_new/core/message/message_util.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/feature/geography_select/province_city_select_provider.dart';
import 'package:application_new/feature/travel_create/page/travel_city_form.dart';
import 'package:application_new/feature/travel_create/page/travel_date_form.dart';
import 'package:application_new/feature/travel_create/page/travel_companion_type_form.dart';
import 'package:application_new/feature/travel_create/page/travel_motivation_type_form.dart';
import 'package:application_new/feature/travel_create/page/travel_name_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/travel_create_provider.dart';

class TravelCreatePage extends ConsumerStatefulWidget {
  const TravelCreatePage({super.key});

  @override
  ConsumerState createState() => _CreateTravelPageState();
}

class _CreateTravelPageState extends ConsumerState<TravelCreatePage> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = ref.watch(translationServiceProvider);

    ref.listen(provinceCitySelectProvider, (prev, next) {
      final selectedCities = next.selectedCities;
      if (prev?.selectedCities == selectedCities) return;

      if (selectedCities.length > 10) {
        MessageUtil.showSnackBar(context,
            MessageEvent(tr.from('You can select up to {}.', args: ['${10}'])));
      }

      final notifier = ref.read(travelCreateProvider.notifier);
      notifier.selectCities(selectedCities.mapToEntity().toList());
    });

    return Scaffold(
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            TravelDateForm(pageController),
            TravelCityForm(pageController),
            TravelCompanionTypeForm(pageController),
            TravelMotivationTypeForm(pageController),
            TravelNameForm(pageController),
          ]),
    );
  }
}
