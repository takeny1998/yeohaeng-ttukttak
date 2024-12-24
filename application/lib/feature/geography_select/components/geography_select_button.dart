import 'package:application_new/domain/geography/geography_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GeographySelectButton extends ConsumerWidget {
  final double width, height;

  final GeographyModel geography;

  final VoidCallback onPressed;
  final void Function(GeographyModel geography) onSelect;

  final bool isActive, isSelected;

  const GeographySelectButton({
    super.key,
    required this.width,
    required this.height,
    required this.geography,
    required this.isActive,
    required this.isSelected,
    required this.onPressed,
    required this.onSelect
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
          onPressed: () {
            if (isActive) {
              onSelect(geography);
            }
            onPressed();
          },
          child: Text(geography.shortName)),
    );
  }
}
