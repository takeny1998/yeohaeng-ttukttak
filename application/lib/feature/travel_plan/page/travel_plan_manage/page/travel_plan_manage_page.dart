import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/common/log/logger.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_edit_list_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_manage_edit_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/travel_plan_date_view.dart';

class TravelPlanManagePage extends ConsumerWidget {
  final int travelId;

  const TravelPlanManagePage({super.key, required this.travelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(travelPlanManageProvider(travelId));

    if (state == null) {
      return const SliverFillRemaining(child: LoadingPage());
    }

    final TravelPlanManageState(:travel, :visits, :selectedDate) = state;

    Future<void> editPlans() async {
      final editedPlans =
          await showModalBottomSheet<List<TravelVisitEditModel>>(
              isScrollControlled: true,
              useSafeArea: true,
              enableDrag: false,
              context: context,
              builder: (context) => TravelPlanManageEditView(visits: visits));

      if (editedPlans == null) return;

      await ref
          .read(travelPlanManageProvider(travelId).notifier)
          .edit(editedPlans);

      eventController
          .add(MessageEvent(TranslationUtil.message('travel_plan_edited')));
    }

    final selectedVisits = visits
        .where((visit) => DateUtils.isSameDay(visit.visitedOn, selectedDate));

    return SliverMainAxisGroup(slivers: [
      SliverToBoxAdapter(
          child: TextButton(onPressed: editPlans, child: const Text('수정'))),
      SliverList(
          delegate: SliverChildListDelegate([
        TravelPlanDateView(
          onChangeDate: (date) => ref
              .read(travelPlanManageProvider(travelId).notifier)
              .selectDate(date),
          travel: travel,
          selectedDate: selectedDate,
        ),
        for (final visit in selectedVisits) ...[
          TravelPlanEditListItem(onDeleted: () {}, order: 0, visit: visit)
        ]
      ])),
    ]);
  }
}
