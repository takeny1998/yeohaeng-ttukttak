
import 'dart:ffi';

import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:flutter/material.dart';

class TravelCityPoisTypeFilterItem extends StatelessWidget {

  final bool isSelected;
  final PlaceCategoryType categoryType;

  final void Function(PlaceCategoryType categoryType) onDelete, onSelect;

  const TravelCityPoisTypeFilterItem({super.key, required this.isSelected, required this.categoryType, required this.onDelete, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

  return FilterChip(
        labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        showCheckmark: false,
        onDeleted: isSelected
            ? () => onDelete(categoryType)
            : null,
        onSelected: (_) => onSelect(categoryType),
        label: Text(TranslationUtil.enumValue(categoryType)),
        avatar: Icon(categoryType.iconData, color: isSelected ? colorScheme.primary : colorScheme.onSurface),
        selected: isSelected);
  }
}
