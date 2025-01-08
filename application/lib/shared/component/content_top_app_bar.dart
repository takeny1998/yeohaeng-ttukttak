import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentTopAppBar extends ConsumerWidget {

  final Widget child;
  final EdgeInsets? padding;

  const ContentTopAppBar({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme(
        :onPrimary,
        :primary,
        :surfaceContainerHighest,
        :onSurface
    ) = Theme.of(context).colorScheme;

    return Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: surfaceContainerHighest))),
        padding: padding ?? const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 8.0),
        child: child);
  }
}
