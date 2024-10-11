
import 'package:flutter/material.dart';

class SmallFilledChip extends StatelessWidget {

  final String _label;

  const SmallFilledChip({super.key, required String label}) : _label = label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)),
        side: BorderSide.none,
        backgroundColor: colorScheme.primaryContainer,
        labelStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
        label: Text(_label));
  }
}
