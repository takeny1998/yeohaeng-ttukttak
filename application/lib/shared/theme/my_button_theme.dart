import 'package:flutter/material.dart';

class MyButtonTheme extends StatelessWidget {
  final Widget child;

  const MyButtonTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);

    final ColorScheme(:onSurface) = Theme.of(context).colorScheme;

    final buttonTextStyle = TextStyle(fontWeight: FontWeight.w600, color: onSurface);

    return Theme(
      data: Theme.of(context).copyWith(
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: EdgeInsets.zero,
                foregroundColor: colorScheme.onSurface,
                textStyle: textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600))),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            textStyle: buttonTextStyle,
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16)
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: colorScheme.surfaceDim),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            textStyle: buttonTextStyle,
            foregroundColor: onSurface,
          ),
        ),
      ),
      child: child,
    );
  }
}
