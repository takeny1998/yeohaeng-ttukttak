import 'package:application/features/notification/data/dao/hive_notification_repository.dart';
import 'package:application/features/notification/data/model/notification_model.dart';
import 'package:application/features/notification/domain/dao/notification_repository.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_repository_provider.g.dart';


@riverpod
NotificationRepository notificationRepository(NotificationRepositoryRef ref) {
  return HiveNotificationRepository(box: Hive.box("notifications"));
}
