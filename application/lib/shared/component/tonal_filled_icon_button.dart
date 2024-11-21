import 'package:flutter/material.dart';

final class TonalFilledIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;
  final double? iconSize;
  final Color? foregroundColor;

  const TonalFilledIconButton(
      {super.key,
      required this.icon,
      this.onPressed,
      this.iconSize,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    return IconButton.filledTonal(
      style: IconButton.styleFrom(
          iconSize: iconSize ?? 18.0,
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(
                  side: BorderSide(color: colorScheme.primaryFixedDim),
                  borderRadius: BorderRadius.circular(12.0))),
      onPressed: onPressed ?? () {},
      icon: icon,
    );
  }
}
