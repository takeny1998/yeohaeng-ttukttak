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
    final member = comment != null
        ? ref.watch(memberProvider(comment!.createdBy)).value
        : null;

    return ListTile(
      leading: member != null ? ProfileAvatar(avatar: member.avatar) : null,
      title: Text('${member?.nickname ?? ''}님의 답글'),
      subtitle: Text(comment?.content ?? ''),
    );
  }
}
