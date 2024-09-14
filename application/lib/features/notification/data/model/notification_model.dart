import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_event.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@Freezed()
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String title,
    required String body,
    required NotificationEvent event,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  factory NotificationModel.fromRemoteMessage(RemoteMessage message) {
    final RemoteMessage(messageId: id, :notification, :data) = message;

    return NotificationModel(
      id: id!,
      title: notification?.title ?? '',
      body: notification?.body ?? '',
      event: NotificationEvent.fromJson(data),
    );
  }
}
