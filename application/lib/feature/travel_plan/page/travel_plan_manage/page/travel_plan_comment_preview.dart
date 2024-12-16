import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_comment_list_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanCommentView extends ConsumerWidget {
  final TravelModel travel;
  final TravelPlanModel plan;

  const TravelPlanCommentView(
      {super.key, required this.travel, required this.plan});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(travelPlanCommentProvider(travel.id, plan.id));

    return state.when(
      data: (data) {
        return Column(children: [
          for (final comment in data.comments.take(2))
            TravelPlanCommentListItem(comment: comment)
        ]);
      },
      loading: () {
        return Column(children: [for (int i = 0; i < 2; i++) const ListTile()]);
      },
      error: (error, stackTrace) => throw error,
    );
  }
}
