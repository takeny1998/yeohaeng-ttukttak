import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SafeBottomView extends ConsumerWidget {

  final Widget child;

  const SafeBottomView({super.key, required this.child });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme(:surfaceContainerHighest, :surface) = Theme.of(context).colorScheme;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
        decoration: BoxDecoration(
          color: surface,
            border: Border(
                top: BorderSide(color: surfaceContainerHighest))),
        child: child
      ),
    );
  }
}
