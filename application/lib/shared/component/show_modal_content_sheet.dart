import 'package:flutter/material.dart';

Future<T?> showModalContentSheet<T>(
    BuildContext context, Widget content) async {
  final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

  return showModalBottomSheet<T>(
      context: context,
      backgroundColor: colorScheme.surface,
      isScrollControlled: true,
      builder: (context) => SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: content),
          ));
}
