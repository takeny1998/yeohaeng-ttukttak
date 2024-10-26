
import 'package:flutter/material.dart';

class SmallChip extends StatelessWidget {

  final String _label;

  const SmallChip({super.key, required String label}) : _label = label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)),
        side: BorderSide.none,
        labelStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
        label: Text(_label));
  }
}
