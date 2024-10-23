import 'package:flutter/material.dart';

class MyButtonTheme extends StatelessWidget {
  final Widget child;

  const MyButtonTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);

    return Theme(
      data: Theme.of(context).copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: colorScheme.surfaceDim),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            textStyle:
                textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      child: child,
    );
  }
}
