import 'package:application_new/common/session/session_model.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/domain/member/member_model.dart';
import 'package:application_new/domain/member/member_provider.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/feature/profile/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelMemberListItem extends ConsumerWidget {
  final TravelModel travel;
  final MemberModel? member;
  final Widget? trailing;

  const TravelMemberListItem(
      {super.key, required this.travel, required this.member, this.trailing});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);

    final SessionModel(member: me) = ref.watch(sessionProvider);
    final leader = ref.watch(memberProvider(travel.memberId)).value;

    final tr = ref.watch(translationServiceProvider);

    String name = member?.nickname ?? '';
    String description =
        tr.from(member?.uuid == leader?.uuid ? 'leader' : 'member');

    if (member?.uuid == me?.uuid) {
      description += ' · ${tr.from('me')}';
    }

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
      leading: CircleAvatar(
          radius: 28.0,
          backgroundColor: colorScheme.surfaceContainer,
          child: ProfileAvatar(avatar: member?.avatar, radius: 26.0)),
      title: Row(
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(width: 4.0),
          Text('#${member?.uuid.substring(0, 6).toUpperCase() ?? ''}',
              style: TextStyle(
                  fontSize: 12.0, color: colorScheme.onSurfaceVariant)),
        ],
      ),
      subtitle: Text(
        description,
        style: const TextStyle(fontSize: 13.0),
      ),
      trailing: trailing,
    );
  }
}
