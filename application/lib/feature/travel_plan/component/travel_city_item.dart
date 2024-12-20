import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/shared/model/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    final province = ref.watch(provinceProvider(city.parentId)).value;

    final backgroundColor =
        isSelected ? colorScheme.primaryContainer : colorScheme.surface;

    final ImageModel(:path, :name, :ext) = city.insignia;

    return AnimatedContainer(
      color: backgroundColor,
      height: 120.0,
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
              Text(province?.name ?? '', style: regionStyle),
            ]),
          ),
        ),
      ),
    );
  }
}
