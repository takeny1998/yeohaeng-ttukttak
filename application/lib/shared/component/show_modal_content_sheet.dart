import 'package:flutter/material.dart';

Future<T?> showModalContentSheet<T>(
    BuildContext context, Widget content, { bool? showDragHandle }) async {
  final ColorScheme(:surface) = Theme.of(context).colorScheme;

  return showModalBottomSheet<T>(
      context: context,
      backgroundColor: surface,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: showDragHandle ?? true,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      builder: (context) => SafeArea(child: content));
}
