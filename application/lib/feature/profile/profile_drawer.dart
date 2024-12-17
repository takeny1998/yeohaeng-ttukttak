import 'package:application_new/common/router/router_provider.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/domain/member/member_model.dart';
import 'package:application_new/feature/profile/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(sessionProvider).member;

    final tr = ref.watch(translationServiceProvider);
    final ThemeData(:colorScheme) = Theme.of(context);

    const tilePadding = EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0);

    return Drawer(
      child: SafeArea(
        child: ListView(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close)),
                  ),
                  Wrap(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none_outlined)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings_outlined)),
                      const SizedBox(width: 8.0),
                    ],
                  )
                ],
              ),
              ListTile(
                leading: ProfileAvatar(avatar: member?.avatar),
                title: Text(
                  member?.nickname ?? tr.from('Please Log in.'),
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                  ),
                ),
                subtitle: member != null
                    ? Text(
                        '#${member?.uuid.substring(0, 8)}',
                        style: const TextStyle(fontSize: 14.0),
                      )
                    : null,
              ),
              const SizedBox(height: 8.0),
              if (member != null) ...[
                ListTile(
                  onTap: () => context.push('/profile/edit'),
                  contentPadding: tilePadding,
                  title: Text(
                    tr.from('Edit profile'),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                ),
                Container(height: 8.0, color: colorScheme.surfaceContainerHigh),
              ]
            ]),
      ),
    );
  }
}
