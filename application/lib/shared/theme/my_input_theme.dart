import 'package:flutter/material.dart';

class MyInputTheme extends StatelessWidget {
  final Widget child;

  const MyInputTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme(
        data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold))),
        child: child);
  }
}
