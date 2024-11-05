import 'package:flutter/material.dart';

class MyAppBarTheme extends StatelessWidget {
  final Widget child;

  const MyAppBarTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);

    final themeData = Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
            centerTitle: false,
            scrolledUnderElevation: 0.0,
            backgroundColor: colorScheme.surface,
            shape: Border(bottom: BorderSide(color: colorScheme.surfaceContainerHigh)),
            titleTextStyle: TextStyle(
                fontSize: 20.0,
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600)));

    return Theme(data: themeData, child: child);
  }
}
