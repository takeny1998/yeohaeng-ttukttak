import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryChip extends ConsumerWidget {
  final Widget label;
  final Widget? avatar;

  const PrimaryChip({super.key, required this.label, this.avatar});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = Theme.of(context);

    final ColorScheme(:primary, :onPrimary, :onSurface, :primaryContainer) =
        themeData.colorScheme;

    return Chip(
        iconTheme: themeData.iconTheme.copyWith(color: onPrimary),
        backgroundColor: primary,
        labelStyle: TextStyle(color: onPrimary),
        avatar: avatar,
        label: label);
  }
}
