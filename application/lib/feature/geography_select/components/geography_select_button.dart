import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GeographySelectButton extends ConsumerWidget {
  final double width, height;
  final String label;

  final VoidCallback onPressed;

  final bool isActive, isSelected;

  const GeographySelectButton({
    super.key,
    required this.width,
    required this.height,
    required this.label,
    required this.isActive,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    Color? backgroundColor, foregroundColor, borderColor;

    if (isSelected) {
      borderColor = colorScheme.primaryFixedDim;
      backgroundColor = colorScheme.primaryFixed;
    }

    if (isActive) {
      backgroundColor = colorScheme.primary;
      foregroundColor = colorScheme.onPrimary;
      borderColor = colorScheme.onPrimary;
    }

    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            visualDensity: VisualDensity.compact,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            side: BorderSide(
                width: 0.5,
                color: borderColor ?? colorScheme.surfaceContainerHighest),
            shape: const BeveledRectangleBorder(),
          ),
          onPressed: onPressed,
          child: Text(label)),
    );
  }
}
