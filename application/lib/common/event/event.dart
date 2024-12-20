import 'dart:async';
import 'dart:ui';

import 'package:application_new/shared/dto/reference.dart';

sealed class Event {}

class MessageEvent extends Event {
  final String message;
  final Reference<String, VoidCallback>? onActionRef;

  MessageEvent(this.message, {this.onActionRef});
}

final eventController = StreamController<Event>();
