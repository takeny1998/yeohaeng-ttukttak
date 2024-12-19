import 'package:application_new/common/event/event.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/feature/travel_create/page/select_travel_city_form.dart';
import 'package:application_new/feature/travel_create/page/select_travel_date_form.dart';
import 'package:application_new/feature/travel_create/page/select_travel_detail_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/travel_create_provider.dart';
import 'travel_city_select_view.dart';

class TravelCreatePage extends ConsumerStatefulWidget {
  const TravelCreatePage({super.key});

  @override
  ConsumerState createState() => _CreateTravelPageState();
}

class _CreateTravelPageState extends ConsumerState<TravelCreatePage> {
  final PageController pageController = PageController(
    keepPage: false,
  );

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
    ref.listen(travelCreateProvider, (prev, next) {

      final tr = ref.read(translationServiceProvider);

      if (next.isSubmitted) {
        eventController.add(MessageEvent(tr.from('The travel has been created successfully.')));
        context.pop();
      }

      final curtPageNumber = pageController.page?.toInt();
      if (curtPageNumber == next.pageNumber) return;

      pageController.animateToPage(
        next.pageNumber,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });

    return Scaffold(
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController, children: [
        const SelectTravelDateForm(),
        const SelectTravelDetailForm(),
        TravelCitySelectView(onCancel: previousPage),
      ]),
    );
  }

  void previousPage() {

    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
