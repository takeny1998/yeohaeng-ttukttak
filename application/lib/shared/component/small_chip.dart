import 'package:flutter/material.dart';

class SmallChip extends StatelessWidget {
  final String label;

  final Widget? leading;

  final Color? backgroundColor;
  final Color? foregroundColor;

  const SmallChip(
      {super.key,
      required this.label,
      this.leading,
      this.backgroundColor,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Chip(
        backgroundColor: backgroundColor,
        visualDensity: VisualDensity.compact,
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        side: BorderSide.none,
        labelStyle: textTheme.labelMedium?.copyWith(
          color: foregroundColor ?? colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
        avatarBoxConstraints: const BoxConstraints.tightForFinite(),
        avatar: leading,
        label: Text(label));
  }
}
