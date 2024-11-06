import 'package:flutter/material.dart';

class MyFabTheme extends StatelessWidget {
  final Widget child;

  const MyFabTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);

    final themeData = Theme.of(context).copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: CircleBorder(side: BorderSide(color: colorScheme.primaryFixedDim)),
      elevation: 0.0,
      foregroundColor: colorScheme.primary,
      backgroundColor: colorScheme.primaryContainer,
    ));

    return Theme(data: themeData, child: child);
  }
}
