import 'package:flutter/material.dart';

final class FilledTonalIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final double? iconSize;
  final Color? foregroundColor;

  const FilledTonalIconButton(
      {super.key,
      required this.icon,
      this.onPressed,
      this.iconSize,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    var iconSize = this.iconSize ?? 18.0;
    return IconButton.filledTonal(
      style: IconButton.styleFrom(
          iconSize: iconSize,
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(
                  side: BorderSide(color: colorScheme.primaryFixedDim),
                  borderRadius: BorderRadius.circular(8.0))),
      onPressed: onPressed ?? () {},
      icon: icon,
    );
  }
}
