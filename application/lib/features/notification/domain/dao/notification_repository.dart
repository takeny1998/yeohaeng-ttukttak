
import 'dart:async';

import 'package:application/features/notification/data/model/notification_model.dart';

abstract interface class NotificationRepository {

  FutureOr<NotificationModel?> find(String id);

  FutureOr<List<NotificationModel>> findAll();

  FutureOr<void> save(NotificationModel model);

  FutureOr<void> delete(String id);

}