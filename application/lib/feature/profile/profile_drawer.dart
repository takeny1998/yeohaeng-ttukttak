import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/domain/member/member_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(sessionProvider).member;

    final tr = ref.watch(translationServiceProvider);

    final ThemeData(:colorScheme) = Theme.of(context);

    final avatar = member?.avatar;
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
                leading: CircleAvatar(
                  radius: 32.0,
                  backgroundColor: colorScheme.primaryContainer,
                  backgroundImage: avatar != null
                      ? NetworkImage(
                          '${avatar.host}/${avatar.path}.${avatar.ext}')
                      : null,
                ),
                title: Text(
                  member?.nickname ?? tr.from('please_log_in'),
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
              ListTile(
                onTap: member != null ? () {} : null,
                contentPadding: tilePadding,
                title: Text(
                  tr.from('edit_profile'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_outlined),
              ),
              Container(height: 8.0, color: colorScheme.surfaceContainerHigh),
            ]),
      ),
    );
  }
}
