import 'package:flutter/material.dart';

class MyChipTheme extends StatelessWidget {
  final Widget _child;

  const MyChipTheme({super.key, required Widget child}) : _child = child;

  @override
  Widget build(BuildContext context) {

    final ColorScheme(:primary, :onPrimary, :onSurface, :secondaryContainer) =
        Theme.of(context).colorScheme;

    final foregroundColor = WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return onPrimary;
      }
      return onSurface;
    });

    final backgroundColor = WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return BorderSide(color: primary);
      }
      return BorderSide(color: secondaryContainer);
    });

    return Theme(
        data: Theme.of(context).copyWith(
          chipTheme: ChipThemeData(
            labelStyle:
                TextStyle(color: foregroundColor, fontWeight: FontWeight.w600),
            secondaryLabelStyle:
                TextStyle(color: primary, fontWeight: FontWeight.w600),
            selectedColor: primary,
            checkmarkColor: onPrimary,
            backgroundColor: secondaryContainer,
            deleteIconColor: primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            side: backgroundColor,
            padding: const EdgeInsets.all(8.0),
          ),
        ),
        child: _child);
  }
}
