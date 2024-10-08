import 'package:application_new/common/event/event.dart';
import 'package:application_new/feature/travel/provider/create_travel_provider.dart';
import 'package:application_new/feature/travel/page/select_travel_city_form.dart';
import 'package:application_new/feature/travel/page/select_travel_date_form.dart';
import 'package:application_new/feature/travel/page/select_travel_detail_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateTravelPage extends ConsumerStatefulWidget {
  const CreateTravelPage({super.key});

  @override
  ConsumerState createState() => _CreateTravelPageState();
}

class _CreateTravelPageState extends ConsumerState<CreateTravelPage> {
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
    ref.listen(createTravelProvider, (prev, next) {
      if (next.isSubmitted) {
        eventController.add(MessageEvent('travel.created'.tr()));
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
      body: PageView(controller: pageController, children: const [
        SelectTravelDateForm(),
        SelectTravelDetailForm(),
        SelectTravelCityForm()
      ]),
    );
  }
}
