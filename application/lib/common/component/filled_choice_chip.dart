import 'package:flutter/material.dart';

class FilledChoiceChip extends StatelessWidget {
  final bool _isSelected;
  final void Function(bool)? _onSelected;
  final String _labelText;

  const FilledChoiceChip({
    super.key,
    required bool isSelected,
    required String labelText,
    void Function(bool)? onSelected,
  })  : _isSelected = isSelected,
        _onSelected = onSelected,
        _labelText = labelText;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Theme(
      data: Theme.of(context).copyWith(
        chipTheme: ChipThemeData(
            secondaryLabelStyle: TextStyle(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
            selectedColor: colorScheme.primary,
            checkmarkColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primaryContainer,
            labelStyle: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
            side: BorderSide.none,
            padding: const EdgeInsets.all(10.0)),
      ),
      child: ChoiceChip(
        selected: _isSelected,
        onSelected: _onSelected,
        label: Text(_labelText),
      ),
    );
  }
}
