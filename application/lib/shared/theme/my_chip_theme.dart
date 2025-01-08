import 'package:flutter/material.dart';

class MyChipTheme extends StatelessWidget {
  final Widget _child;

  const MyChipTheme({super.key, required Widget child}) : _child = child;

  @override
  Widget build(BuildContext context) {
    final ColorScheme(:surfaceContainer, :onSurface, :secondaryContainer) =
        Theme.of(context).colorScheme;

    final foregroundColor = onSurface;

    final borderSide = WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return BorderSide(color: secondaryContainer);
      }
      return BorderSide(color: surfaceContainer);
    });

    return Theme(
        data: Theme.of(context).copyWith(
          chipTheme: ChipThemeData(
            labelStyle:
            TextStyle(color: foregroundColor, fontWeight: FontWeight.w600),
            secondaryLabelStyle:
            TextStyle(color: foregroundColor, fontWeight: FontWeight.w600),
            selectedColor: secondaryContainer,
            backgroundColor: surfaceContainer,
            checkmarkColor: foregroundColor,
            deleteIconColor: foregroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            side: borderSide,
            padding: const EdgeInsets.all(8.0),
          ),
        ),
        child: _child);
  }
}
