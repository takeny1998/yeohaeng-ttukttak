import 'package:flutter/material.dart';

class MyChipTheme extends StatelessWidget {
  final Widget _child;

  const MyChipTheme({super.key, required Widget child}) : _child = child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme(
        data: Theme.of(context).copyWith(
          chipTheme: ChipThemeData(
              labelStyle: TextStyle(
                color: WidgetStateColor.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return colorScheme.primary;
                  }
                  return colorScheme.onSurface;
                }),
                fontWeight: FontWeight.w600,
              ),
              secondaryLabelStyle: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
              selectedColor: colorScheme.primaryContainer,
              checkmarkColor: colorScheme.primary,
              backgroundColor: colorScheme.surfaceContainerLow,
              deleteIconColor: colorScheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              side: WidgetStateBorderSide.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return BorderSide(color: colorScheme.primaryFixedDim);
                }
                return BorderSide(color: colorScheme.surfaceDim);
              }),
              padding: const EdgeInsets.all(8.0)),
        ),
        child: _child);
  }
}
