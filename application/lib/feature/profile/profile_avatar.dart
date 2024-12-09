import 'package:application_new/common/session/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileAvatar extends ConsumerWidget {

  final double? radius;

  const ProfileAvatar({super.key, this.radius = 32.0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatar = ref.watch(sessionProvider).member?.avatar;
    final ThemeData(:colorScheme) = Theme.of(context);

    return CircleAvatar(
      radius: radius,
      backgroundColor: colorScheme.primaryContainer,
      backgroundImage: avatar != null
          ? NetworkImage(
          '${avatar.host}/${avatar.path}.${avatar.ext}')
          : null,
    );
  }
}
