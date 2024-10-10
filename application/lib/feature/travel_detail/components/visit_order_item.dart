import 'package:flutter/material.dart';

class VisitOrderItem extends StatelessWidget {
  final bool _isSelected;
  final int _order;

  const VisitOrderItem({super.key, required int order, bool isSelected = true})
      : _order = order,
        _isSelected = isSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return CircleAvatar(
        radius: 18.0,
        backgroundColor:
            _isSelected ? colorScheme.primary : colorScheme.secondary,
        child: Text(
          '$_order',
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color:
                _isSelected ? colorScheme.onPrimary : colorScheme.onSecondary,
          ),
        ));
  }
}
