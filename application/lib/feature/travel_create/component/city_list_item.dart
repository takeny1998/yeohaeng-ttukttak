import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/shared/model/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CityListItem extends ConsumerWidget {
  final RegionModel region;
  final CityModel city;
  final bool isSelected;
  final VoidCallback onSelect;

  const CityListItem({
    super.key,
    required this.region,
    required this.city,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final titleStyle =
        textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);

    final ImageModel(:path, :name, :ext) = city.insignia;

    return CheckboxListTile(
      secondary: CircleAvatar(
        radius: 24.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.network('https://host.tatine.kr$path/$name.$ext'),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: Text(city.name, style: titleStyle),
      subtitle: Text(
        region.name,
        style: textTheme.bodyMedium?.copyWith(color: colorScheme.secondary),
      ),
      value: isSelected,
      onChanged: (_) => onSelect(),
    );
  }
}
