import 'package:application_new/common/util/string_extension.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_state.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CityPlaceListItem extends StatelessWidget {
  final PlaceMetricModel placeMetric;

  const CityPlaceListItem({super.key, required this.placeMetric});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);
    final PlaceMetricModel(:place, :rating) = placeMetric;

    final titleStyle =
        textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);
    final subTitleStyle =
        TextStyle(fontSize: 13.0, color: colorScheme.onSurfaceVariant);

    return Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: IntrinsicHeight(
        child: Row(children: [
          Expanded(
            flex: 6,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(color: colorScheme.primaryContainer)),
          ),
          const Spacer(flex: 1),
          Expanded(
              flex: 16,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(place.name, style: titleStyle),
                Text(place.address.value?.lineBreakByWord() ?? '', style: subTitleStyle),
                const SizedBox(height: 8.0),
                Wrap(spacing: 8.0, children: [
                  if (rating != null)
                    SmallChip(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        leading: Icon(Icons.star_rate_rounded,
                            color: colorScheme.onPrimary),
                        label: rating.toStringAsFixed(2)),
                  for (final categoryType in place.categoryTypes)
                    SmallChip(label: enumKey(categoryType).tr()),
                ]),
              ])),
        ]),
      ),
    );
  }
}
