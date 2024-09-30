import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/geography/model/region_model.dart';
import 'package:application_new/feature/travel/provider/create_travel_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CityListItem extends ConsumerWidget {
  final RegionModel _region;
  final CityModel _city;

  const CityListItem(
      {super.key, required RegionModel region, required CityModel city})
      : _region = region,
        _city = city;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCities = ref.watch(createTravelProvider).cities;
    final searchText = ref.watch(createTravelProvider).citySearchText;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final otherText = searchText != null
        ? _city.name.replaceFirst(searchText, '')
        : _city.name;

    final titleStyle =
        textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);

    return CheckboxListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: Row(
        children: [
          Text.rich(
            style: titleStyle,
            TextSpan(
              children: [
                TextSpan(
                    text: searchText,
                    style: TextStyle(color: colorScheme.primary)),
                TextSpan(text: otherText)
              ],
            ),
          ),
        ],
      ),
      subtitle: Text(
        '${_region.name} · ${'korea'.tr()}',
        style: textTheme.bodyMedium?.copyWith(color: colorScheme.secondary),
      ),
      value: selectedCities.contains(_city),
      onChanged: (_) =>
          ref.read(createTravelProvider.notifier).selectCity(_city),
    );
  }
}
