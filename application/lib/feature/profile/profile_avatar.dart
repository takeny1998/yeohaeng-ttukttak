import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/domain/member/member_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileAvatar extends ConsumerWidget {

  final AvatarModel? avatar;
  final double? radius;

  const ProfileAvatar({super.key, this.avatar, this.radius = 32.0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);

    return CircleAvatar(
      radius: radius,
      backgroundColor: colorScheme.primaryContainer,
      backgroundImage: avatar != null
          ? NetworkImage(
          '${avatar!.host}/${avatar!.path}.${avatar!.ext}')
          : null,
    );
  }
}
