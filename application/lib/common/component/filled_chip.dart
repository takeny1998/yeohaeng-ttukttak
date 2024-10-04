
import 'package:flutter/material.dart';

class FilledChip extends StatelessWidget {

  final String _label;

  const FilledChip({super.key, required String label}) : _label = label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Chip(
        // padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0)),
        side: BorderSide.none,
        backgroundColor: colorScheme.primaryContainer,
        labelStyle: textTheme.labelLarge?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
        label: Text(_label));
  }
}
