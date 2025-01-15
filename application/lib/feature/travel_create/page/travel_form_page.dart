import 'package:application_new/common/event/event.dart';
import 'package:application_new/core/message/message_util.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/feature/geography_select/province_city_select_provider.dart';
import 'package:application_new/feature/travel_create/page/travel_city_form.dart';
import 'package:application_new/feature/travel_create/page/travel_date_form.dart';
import 'package:application_new/feature/travel_create/page/travel_companion_type_form.dart';
import 'package:application_new/feature/travel_create/page/travel_motivation_type_form.dart';
import 'package:application_new/feature/travel_create/page/travel_name_form.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:application_new/shared/component/paged_form_bottom_control_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/travel_create_provider.dart';

class TravelFormPage extends ConsumerStatefulWidget {

  final bool Function(TravelCreateState) canSubmit;

  final void Function(TravelCreateState) onSubmit;

  final int pageSize;
  
  final List<Widget>
  Function(PagedFormBottomControlViewBuilder bottomViewBuilder) buildPages;

  final TravelCreateState? initialState;

  const TravelFormPage(
      {super.key,
      required this.canSubmit,
      required this.onSubmit,
       required this.pageSize,
      required this.buildPages,
      this.initialState});

  @override
  ConsumerState createState() => _CreateTravelPageState();
}

class _CreateTravelPageState extends ConsumerState<TravelFormPage> {
  final PageController pageController = PageController();

  @override
  void initState() {
    Future.microtask(() {
      final initState = widget.initialState;

      if (initState == null) return;

      final travelFormNotifier = ref.read(travelCreateProvider.notifier);

      travelFormNotifier.enterName(initState.name);

      for (final motivationType in initState.motivationTypes) {
        travelFormNotifier.selectMotivationType(motivationType);
      }

      for (final companionType in initState.companionTypes) {
        travelFormNotifier.selectCompanionType(companionType);
      }

      travelFormNotifier.selectCities(initState.cities);

      travelFormNotifier.selectDate(initState.startedOn, initState.endedOn);
    });

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

    final state = ref.watch(travelCreateProvider);

    final canSubmit = widget.canSubmit(state);

    final bottomViewBuilder = 
    PagedFormBottomControlView.create(pageController, pageSize: widget.pageSize, canSubmit: canSubmit, onSubmit: () => widget.onSubmit(state));

    return Scaffold(
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: widget.buildPages(bottomViewBuilder)),
    );
  }
}
