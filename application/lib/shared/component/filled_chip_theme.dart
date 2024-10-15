import 'package:flutter/material.dart';

class FilledChipTheme extends StatelessWidget {

  final Widget _chip;

  const FilledChipTheme({super.key, required Widget child}) : _chip = child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Theme(
      data: Theme.of(context).copyWith(
        chipTheme: ChipThemeData(
            labelStyle: TextStyle(
              color: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return colorScheme.onPrimary;
                }
                return colorScheme.primary;
              }),
              fontWeight: FontWeight.w600,
            ),
            secondaryLabelStyle: TextStyle(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
            selectedColor: colorScheme.primary,
            checkmarkColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primaryContainer,
            side: BorderSide.none,
            padding: const EdgeInsets.all(10.0)),
      ),
      child: _chip);
  }
}
