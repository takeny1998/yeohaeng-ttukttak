import 'package:flutter/material.dart';

final class OutlinedIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;
  final double? iconSize;
  final Color? foregroundColor;

  const OutlinedIconButton(
      {super.key, required this.icon, this.onPressed, this.iconSize, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    return IconButton(
      style: IconButton.styleFrom(
          iconSize: iconSize ?? 18.0,
          foregroundColor: foregroundColor ?? colorScheme.primary,
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          side: BorderSide(color: colorScheme.surfaceDim)),
      onPressed: onPressed ?? () {},
      icon: icon,
    );
  }
}
