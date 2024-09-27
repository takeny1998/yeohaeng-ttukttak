
import 'dart:async';

sealed class Event {}

class MessageEvent extends Event {

  final String message;

  MessageEvent(this.message);

}

final eventController = StreamController<Event>();