import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelInfoChip extends ConsumerWidget {

  final IconData avatar;
  final String label;

  const TravelInfoChip({super.key, required this.avatar, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Chip(
      padding: const EdgeInsets.only(right: 2.0),
      backgroundColor: colorScheme.primaryContainer,
      labelStyle: TextStyle(
          color: colorScheme.primary, fontSize: 13.0),
      side: BorderSide(
          color: colorScheme.primaryFixedDim),
      label: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 6.0,
        children: [
          Icon(
            avatar,
            size: 14,
            color: colorScheme.primary,
          ),
          Text(label),
        ],
      ),
    );
  }
}
