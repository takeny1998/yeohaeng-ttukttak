
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/shared/interfaces/IconDataProvidable.dart';
import 'package:flutter/material.dart';

class ToggleViewButtonItem<T extends IconDataEnum> extends StatefulWidget {

  final List<T> viewTypes;
  final T selectedType;
  final void Function(int) onToggle;

  const ToggleViewButtonItem({super.key, required this.viewTypes, required this.onToggle, required this.selectedType});

  @override
  State<ToggleViewButtonItem> createState() => _ToggleViewButtonItemState<T>();
}

class _ToggleViewButtonItemState<T> extends State<ToggleViewButtonItem> {

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    return Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ToggleButtons(
            fillColor: colorScheme.primaryContainer,
            borderColor: colorScheme.surfaceContainerHighest,
            selectedBorderColor: colorScheme.primaryFixedDim,
            borderRadius: BorderRadius.circular(12.0),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
            onPressed: widget.onToggle,
            isSelected: widget.viewTypes
                .map((viewType) => viewType == widget.selectedType)
                .toList(),
            children: [
              for (final viewType in widget.viewTypes)
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(viewType.iconData, size: 18.0),
                          const SizedBox(width: 8.0),
                          Text(TranslationUtil.enumValue(viewType)),
                        ])),
            ]));
  }
}