import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/geography/provider/geography_provider.dart';
import 'package:application_new/shared/model/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

class TravelCityItem extends ConsumerWidget {
  final CityModel city;
  final bool isSelected;
  final VoidCallback onSelected;

  final double radius = 24.0;

  const TravelCityItem(
      {super.key,
      required this.city,
      required this.isSelected,
      required this.onSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final cityStyle =
        textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);

    final regionStyle =
        textTheme.labelMedium?.copyWith(color: colorScheme.surfaceTint);

    final region = ref
        .watch(geographyProvider)
        .regions
        .firstWhereOrNull((region) => region.id == city.regionId);

    final backgroundColor =
        isSelected ? colorScheme.primaryContainer : colorScheme.surface;

    final ImageModel(:path, :name, :ext) = city.insignia;

    return AnimatedContainer(
      color: backgroundColor,
      duration: const Duration(milliseconds: 350),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onSelected,
          splashColor: colorScheme.primaryContainer,
          highlightColor: colorScheme.primaryFixedDim,
          child: Container(
            margin:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Column(children: [
              CircleAvatar(
                radius: radius,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.network('https://host.tatine.kr$path/$name.$ext'),
                ),
              ),
              const SizedBox(height: 6.0),
              Text(city.name, style: cityStyle),
              Text(region?.name ?? '', style: regionStyle),
            ]),
          ),
        ),
      ),
    );
  }
}
