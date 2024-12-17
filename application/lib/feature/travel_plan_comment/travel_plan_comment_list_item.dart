import 'package:application_new/common/session/session_model.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/domain/member/member_provider.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_comment_model.dart';
import 'package:application_new/feature/profile/profile_avatar.dart';
import 'package:application_new/feature/travel_plan_comment/travel_plan_comment_provider.dart';
import 'package:application_new/shared/component/action_sheet.dart';
import 'package:application_new/shared/component/action_sheet_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanCommentListItem extends ConsumerWidget {
  final TravelPlanCommentModel comment;
  final TravelPlanCommentProvider provider;
  final bool isCollapsed;

  const TravelPlanCommentListItem(
      {super.key,
      required this.comment,
      required this.provider,
      this.isCollapsed = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);

    final tr = ref.watch(translationServiceProvider);

    final member = ref.watch(memberProvider(comment.createdBy)).value;

    String agoLabel = ' · ';

    if (comment.lastModifiedAt != null) {
      agoLabel += '${timeago.format(
        comment.lastModifiedAt!,
        locale: context.locale.languageCode,
      )} (${tr.from('edited')})';
    } else {
      agoLabel += timeago.format(
        comment.createdAt,
        locale: context.locale.languageCode,
      );
    }

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: colorScheme.surfaceContainer,
        child: member != null
            ? ProfileAvatar(
                avatar: member.avatar,
                radius: 18.0,
              )
            : null,
      ),
      title: Row(
        children: [
          Text(
            tr.from('comment_by_member', args: [member?.nickname ?? '']),
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
          ),
          Text(agoLabel, style: const TextStyle(fontSize: 12.0)),
        ],
      ),
      titleAlignment: ListTileTitleAlignment.titleHeight,
      trailing: !isCollapsed
          ? IconButton(
              onPressed: () => showCommentActionSheet(context, ref),
              icon: const Icon(
                Icons.more_horiz,
                size: 20.0,
              ))
          : null,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 2.0),
          Text(
            comment.content,
            overflow: isCollapsed ? TextOverflow.ellipsis : null,
            style: const TextStyle(fontSize: 13.5),
          ),
        ],
      ),
    );
  }

  void showCommentActionSheet(BuildContext context, WidgetRef ref) {
    final tr = ref.watch(translationServiceProvider);

    final SessionModel(member: loggedInMember) = ref.watch(sessionProvider);

    final isCommentWriter = loggedInMember?.uuid == comment.createdBy;

    ActionSheet.show(context, items: [
      if (isCommentWriter) ...[
        ActionSheetItem(
            title: tr.from('Edit comment'),
            onAction: () {
              final notifier = ref.read(provider.notifier);
              notifier.startEditingComment(comment.id, comment.content);
            }),
        ActionSheetItem(
            title: tr.from('Delete comment'),
            titleColor: Theme.of(context).colorScheme.error,
            onAction: () {
              final notifier = ref.read(provider.notifier);
              notifier.deleteComment(comment.id);
            }),
      ],
    ]);
  }
}
