import 'package:flutter/material.dart';

class MyAppBarTheme extends StatelessWidget {
  final Widget child;

  const MyAppBarTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);

    final themeData = Theme.of(context).copyWith(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorScheme.surface,
          elevation: 0.0,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: colorScheme.surface,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: colorScheme.primary);
            }
            return IconThemeData(color: colorScheme.onSurface);
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(fontSize: 12.0,
                  fontWeight: FontWeight.w600, color: colorScheme.primary);
            }
            return TextStyle(fontSize: 12.0, color: colorScheme.onSurface);
          }),
        ),
        appBarTheme: AppBarTheme(
            centerTitle: false,
            scrolledUnderElevation: 0.0,
            backgroundColor: colorScheme.surface,
            shape: Border(bottom: BorderSide(color: colorScheme.surfaceContainerHigh)),
            titleTextStyle: TextStyle(
                fontSize: 18.0,
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600)));

    return Theme(data: themeData, child: child);
  }
}
