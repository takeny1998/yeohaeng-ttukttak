import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/geography/provider/geography_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

class TravelCityItem extends ConsumerWidget {
  final CityModel city;
  final bool isSelected;
  final VoidCallback onSelected;

  final double radius = 56.0;

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
              Container(
                width: radius,
                height: radius,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(radius),
                    border:
                        Border.all(color: colorScheme.surfaceContainerHighest)),
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
