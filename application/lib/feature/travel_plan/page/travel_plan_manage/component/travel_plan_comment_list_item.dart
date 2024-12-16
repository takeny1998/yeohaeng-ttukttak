import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/domain/member/member_provider.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_comment_model.dart';
import 'package:application_new/feature/profile/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanCommentListItem extends ConsumerWidget {
  final TravelPlanCommentModel? comment;

  const TravelPlanCommentListItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);

    final tr = ref.watch(translationServiceProvider);

    final member = comment != null
        ? ref.watch(memberProvider(comment!.createdBy)).value
        : null;

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
      title: Text(
        tr.from('comment_by_member', args: [member?.nickname ?? '']),
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
      ),
      subtitle: Text(
        comment?.content ?? '',
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 13.5),
      ),
    );
  }
}
