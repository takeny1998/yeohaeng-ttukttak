
import 'package:flutter/material.dart';

class FilledIconButtonTheme extends StatelessWidget {

  final Widget _child;

  const FilledIconButtonTheme({super.key, required Widget child}) : _child = child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme(data: Theme.of(context).copyWith(
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.primary,
        )
      )
    ), child: _child);
  }
}
