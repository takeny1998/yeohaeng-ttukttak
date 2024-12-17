import 'action_sheet_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionSheetGroupItem extends ConsumerWidget {
  final List<ActionSheetItem> items;

  const ActionSheetGroupItem({super.key, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      constraints: const BoxConstraints(
        maxWidth: 480.0,
      ),
      decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(children: [
        for (int i = 0; i < items.length; i++) ...[
          items[i],
          if (i != (items.length - 1))
            Container(
                width: double.maxFinite,
                height: 1.0,
                color: colorScheme.surfaceContainerHighest),
        ],
      ]),
    );
  }
}
