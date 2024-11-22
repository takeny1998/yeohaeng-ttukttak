import 'package:flutter/material.dart';

class TravelInfoListItem extends StatelessWidget {
  final IconData avatar;
  final String label;

  const TravelInfoListItem(
      {super.key, required this.avatar, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
        spacing: 8.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(avatar, size: 18.0, color: colorScheme.onSurfaceVariant),
          Text(label,
              style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600))
        ]);
  }
}
