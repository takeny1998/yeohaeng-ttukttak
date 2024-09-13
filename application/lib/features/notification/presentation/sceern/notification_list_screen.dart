import 'package:application/features/notification/data/model/notification_model.dart';
import 'package:application/features/notification/presentation/provider/notification_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationListScreen extends ConsumerWidget {
  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationStateNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
        ),
        body: notifications.whenOrNull(
          data: (notifications) => Column(
            children: [
              for (NotificationModel notification in notifications)
                ListTile(
                  title: Text(notification.title),
                  subtitle: Text(notification.body),
                  onTap: () => ref
                      .read(notificationStateNotifierProvider.notifier)
                      .handle(notification),
                )
            ],
          ),
        ));
  }
}
