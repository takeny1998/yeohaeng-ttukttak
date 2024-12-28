import 'package:application_new/common/event/event.dart';
import 'package:application_new/main.dart';
import 'package:flutter/material.dart';

class MessageUtil {
  MessageUtil._();

  static void showSnackBar(BuildContext context, MessageEvent event) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(createSnackBar(context, event));
  }

  static void showRootSnackBar(MessageEvent event) {
    final messenger = messengerKey.currentState;

    messenger?.hideCurrentSnackBar();
    messenger?.showSnackBar(createSnackBar(themeKey.currentContext!, event));
  }

  static SnackBar createSnackBar(BuildContext context, MessageEvent event) {
    final ThemeData(:colorScheme) = Theme.of(context);
    final MessageEvent(:message, :onActionRef) = event;

    return SnackBar(
        backgroundColor: colorScheme.primaryContainer,
        content: Text(message,
            style: TextStyle(
                color: colorScheme.onSurface, fontWeight: FontWeight.w600)),
        action: onActionRef != null
            ? SnackBarAction(
                backgroundColor: colorScheme.surface,
                textColor: colorScheme.onSurface,
                label: onActionRef.entity,
                onPressed: onActionRef.reference)
            : null);
  }
}
