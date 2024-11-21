import 'package:flutter/material.dart';

class SmallChip extends StatelessWidget {
  final String label;

  final Widget? leading;

  final Color? borderColor;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const SmallChip(
      {super.key,
      required this.label,
      this.leading,
      this.backgroundColor,
      this.foregroundColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Chip(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        side: borderColor != null ? BorderSide(color: borderColor!) : null,
        labelStyle: TextStyle(
          fontSize: 13.0,
          color: foregroundColor ?? colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
        avatarBoxConstraints: const BoxConstraints(maxWidth: 16),
        avatar: leading,
        label: Text(label));
  }
}
