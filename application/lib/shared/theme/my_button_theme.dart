import 'package:flutter/material.dart';

class MyButtonTheme extends StatelessWidget {
  final Widget child;

  const MyButtonTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);

    final buttonTextStyle =
        textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600);

    return Theme(
      data: Theme.of(context).copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0)
            ),
            foregroundColor: colorScheme.onSurface,
            textStyle: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)
          )),
        filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          textStyle: buttonTextStyle,
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: colorScheme.surfaceDim),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            textStyle: buttonTextStyle,
          ),
        ),
      ),
      child: child,
    );
  }
}
