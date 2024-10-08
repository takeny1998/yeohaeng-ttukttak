
import 'package:flutter/material.dart';

class VisitOrderItem extends StatelessWidget {

  final int _order;

  const VisitOrderItem({super.key, required int order}) : _order = order;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return CircleAvatar(
        radius: 18.0,
        backgroundColor: colorScheme.primary,
        child: Text(
          '$_order',
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.onPrimary,
          ),
        ));
  }
}
