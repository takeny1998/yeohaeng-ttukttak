import 'package:flutter/material.dart';

final class OutlinedIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;
  final double? iconSize;

  const OutlinedIconButton(
      {super.key, required this.icon, this.onPressed, this.iconSize});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    return IconButton(
      style: IconButton.styleFrom(
          iconSize: iconSize ?? 18.0,
          foregroundColor: colorScheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          side: BorderSide(color: colorScheme.surfaceDim)),
      onPressed: onPressed ?? () {},
      icon: icon,
    );
  }
}
