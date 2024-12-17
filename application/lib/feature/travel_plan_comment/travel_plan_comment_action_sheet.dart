import 'package:application_new/common/session/session_model.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_comment_model.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:application_new/feature/travel_plan_comment/travel_plan_comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanCommentActionSheet extends ConsumerWidget {
  final TravelPlanCommentProvider provider;
  final TravelPlanCommentModel comment;

  const TravelPlanCommentActionSheet._(
      {required this.provider, required this.comment});

  static Future<void> showSheet(
    BuildContext context, {
    required TravelPlanCommentProvider provider,
    required TravelPlanCommentModel comment,
  }) async {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).colorScheme.surface,
        isScrollControlled: true,
        enableDrag: false,
        useSafeArea: true,
        context: context,
        builder: (context) => TravelPlanCommentActionSheet._(
            provider: provider, comment: comment));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = ref.watch(translationServiceProvider);
    final colorScheme = Theme.of(context).colorScheme;

    final SessionModel(member: loggedInMember) = ref.watch(sessionProvider);

    final isCommentWriter = loggedInMember?.uuid == comment.createdBy;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
          child: Text(
            tr.from('Comment'),
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 21.0),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 1.0,
          color: colorScheme.surfaceContainerHighest,
        ),
        const SizedBox(height: 8.0),
        if (isCommentWriter) ...[
          ListTile(
              onTap: () {
                ref.read(provider.notifier).startEditingComment(
                  comment.id, comment.content);
                Navigator.of(context).pop();
              },
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              leading: const Icon(Icons.edit_outlined),
              title: Text(tr.from('Edit comment'),
                  style: const TextStyle(fontWeight: FontWeight.w600))),
        ],
        if (isCommentWriter) ...[
          ListTile(
              onTap: () {},
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              iconColor: colorScheme.error,
              textColor: colorScheme.error,
              leading: const Icon(Icons.delete_outline),
              title: Text(tr.from('Delete comment'),
                  style: const TextStyle(fontWeight: FontWeight.w600))),
        ],
        const SizedBox(height: 48.0),
      ],
    );
  }
}
