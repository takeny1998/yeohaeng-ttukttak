import 'package:application/features/notification/presentation/provider/notification_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NotificationButton extends ConsumerWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationStateNotifierProvider);

    return IconButton(
        onPressed: notifications.whenOrNull(
            data: (_) => () => context.pushNamed('notifications')),
        icon: Badge.count(
          count: notifications.whenOrNull(data: (data) => data.length) ?? 0,
          child: const Icon(Icons.notifications),
        ));
  }
}
