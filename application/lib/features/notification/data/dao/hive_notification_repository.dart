import 'dart:async';
import 'dart:convert';

import 'package:application/features/notification/data/model/notification_model.dart';
import 'package:application/features/notification/domain/dao/notification_repository.dart';
import 'package:hive/hive.dart';

final class HiveNotificationRepository implements NotificationRepository {
  final Box box;

  HiveNotificationRepository({required this.box});

  @override
  FutureOr<void> save(NotificationModel model) async {
    await box.put(model.id, jsonEncode(model.toJson()));
  }

  @override
  FutureOr<NotificationModel?> find(String id) {
    final encoded = box.get(id);
    if (encoded == null) return encoded;

    return NotificationModel.fromJson(jsonDecode(encoded));
  }

  @override
  FutureOr<void> delete(String id) async {
    await box.delete(id);
  }

  @override
  FutureOr<List<NotificationModel>> findAll() async {
    return List.from(box.values
        .map((encoded) => NotificationModel.fromJson(jsonDecode(encoded))));
  }
}
