import 'dart:async';
import 'dart:ui';

sealed class Event {}

class MessageEvent extends Event {
  final String message;
  final VoidCallback? onCancel;

  MessageEvent(this.message, {this.onCancel});
}

final eventController = StreamController<Event>();
