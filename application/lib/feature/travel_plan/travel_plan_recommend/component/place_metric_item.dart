import 'package:application_new/common/util/string_extension.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_state.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';

class PlaceMetricItem extends StatelessWidget {
  final PlaceMetricModel placeMetric;

  const PlaceMetricItem({super.key, required this.placeMetric});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final PlaceMetricModel(:place, :rating) = placeMetric;

    final nameStyle =
        textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600);

    final addrStyle = textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w600);

    final trKey = baseKey('travel_plan_recommend');

    return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            width: double.maxFinite,
            height: 176.0,
            color: colorScheme.surfaceContainer,
          )),

      const SizedBox(height: 12.0),
      Text(place.name,
          style: nameStyle, overflow: TextOverflow.ellipsis),
      const SizedBox(height: 4.0),
      Text(place.address.value?.lineBreakByWord() ?? '',
          style: addrStyle,
          overflow: TextOverflow.ellipsis),
      const SizedBox(height: 12.0),
      ExtendedWrap(spacing: 8.0, maxLines: 1, children: [
        if (rating != null)
          SmallChip(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              leading:
                  Icon(Icons.star_rate_rounded, color: colorScheme.onPrimary),
              label: rating.toStringAsFixed(2)),
        for (int i = 0; i < place.categoryTypes.length; i++)
          SmallChip(
              borderColor: i == 0 ? colorScheme.primaryFixedDim : null,
              label: enumKey(place.categoryTypes[i]).tr()),
      ]),
      const SizedBox(height: 16.0),
      SizedBox(
          width: double.maxFinite,
          child: OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(textStyle: addrStyle),
              icon: const Icon(Icons.add_location_outlined, size: 18.0),
              label: Text(trKey('add_to_plan')).tr()))
    ]);
  }
}
