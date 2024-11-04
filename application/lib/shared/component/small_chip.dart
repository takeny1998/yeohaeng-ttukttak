import 'package:flutter/material.dart';

class SmallChip extends StatelessWidget {
  final Color? backgroundColor;
  final String label;

  const SmallChip({super.key, required this.label, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Chip(
      backgroundColor: backgroundColor,
        visualDensity: VisualDensity.compact,
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        side: BorderSide.none,
        labelStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
        label: Text(label));
  }
}
