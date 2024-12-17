import 'package:application_new/common/router/router_provider.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_comment_model.dart';
import 'package:application_new/feature/travel_plan_comment/travel_plan_comment_list_item.dart';
import 'package:application_new/feature/travel_plan_comment/travel_plan_comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TravelPlanCommentPreview extends ConsumerWidget {
  final int travelId;
  final int planId;

  const TravelPlanCommentPreview(
      {super.key, required this.travelId, required this.planId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final provider = travelPlanCommentProvider(travelId, planId);
    final state = ref.watch(provider);

    final tr = ref.watch(translationServiceProvider);

    final List<TravelPlanCommentModel>? comments = state.when(
      data: (data) => data.comments.take(2).toList(),
      error: (error, _) => throw error,
      loading: () => null,
    );

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (comments != null) ...[
        for (final comment in comments)
          TravelPlanCommentListItem(comment: comment, isCollapsed: true, provider: provider),
        const SizedBox(height: 8.0),
      ],
      OutlinedButton.icon(
          onPressed: () => context.push('/travels/$travelId/plans/$planId/comments'),
          icon: const Icon(Icons.comment_outlined, size: 16.0),
          label: Text(tr.from('number_more_comments',
              args: ['${comments?.length ?? '0'}'])))
    ]);
  }
}
