import 'dart:async';

import 'package:application/common/data/model/result.dart';
import 'package:application/config/router/router_provider.dart';
import 'package:application/features/notification/data/model/notification_model.dart';
import 'package:application/features/notification/domain/dao/notification_repository_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class NotificationStateNotifier extends _$NotificationStateNotifier {
  @override
  FutureOr<List<NotificationModel>> build() async {
    return ref.read(notificationRepositoryProvider).findAll();
  }

  Future<void> register(NotificationModel notification) async {
    state = await AsyncValue.guard(() async {
      final repository = ref.read(notificationRepositoryProvider);
      await repository.save(notification);
      return repository.findAll();
    });
  }

  Future<void> handle(NotificationModel notification) async {
    state = await AsyncValue.guard(() async {
      final repository = ref.read(notificationRepositoryProvider);

      // TODO: 이미 앱 내부에서 처리된 알림을 다시 처리할 때?

      final Result result = await notification.event.when(
        newLoginDetected: (deviceName) async {
          final BuildContext? context = rootNavKey.currentContext;
          if (context == null) return Fail();

          context.pushNamed('new-login-detected',
              queryParameters: {'deviceName': notification.event.deviceName});
          return Success(data: null);
        },
      );

      switch (result) {
        case Success():
          await repository.delete(notification.id);
        case _:
      }

      return repository.findAll();
    });
  }
}
