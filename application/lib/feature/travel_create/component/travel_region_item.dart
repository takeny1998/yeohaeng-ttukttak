import 'package:application_new/shared/model/image_model.dart';
import 'package:flutter/material.dart';

class TravelRegionItem extends StatelessWidget {
  final String name;
  final ImageModel? insignia;
  final bool isSelected;
  final VoidCallback onClick;

  final double radius = 24.0;

  const TravelRegionItem({super.key, required this.name, this.insignia, required this.isSelected, required this.onClick});


  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    return ChoiceChip(
        showCheckmark: insignia == null,
        checkmarkColor: colorScheme.primary,
        selectedColor: colorScheme.primaryFixedDim,
        selected: isSelected,
        label: Text(' $name', style: TextStyle(color: colorScheme.primary)),
        avatar: insignia != null ? Builder(
          builder: (context) {
            final ImageModel(:path, :name, :ext) = insignia!;

            return CircleAvatar(
              backgroundColor: Colors.transparent,
                child: Image.network('https://host.tatine.kr$path/$name.$ext'));
          }
        ) : null,
        onSelected: (_) => onClick());
  }
}
