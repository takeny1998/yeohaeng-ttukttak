import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionSheetItem extends ConsumerWidget {
  final String title;
  final VoidCallback onAction;

  final Color? titleColor;

  const ActionSheetItem(
      {super.key,
      required this.title,
      required this.onAction,
      this.titleColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Center(
          child: Text(
        title,
        style: TextStyle(color: titleColor, fontWeight: FontWeight.w600),
      )),
      onTap: onAction,
    );
  }
}
