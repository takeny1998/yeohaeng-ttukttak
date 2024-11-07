
import 'package:application_new/common/util/string_extension.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_state.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PlaceMetricCardItem extends StatelessWidget {

  final PlaceMetricModel placeMetric;

  const PlaceMetricCardItem({super.key, required this.placeMetric});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final PlaceMetricModel(:place, :rating) = placeMetric;

    const titleStyle = TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600);
    final subTitleStyle =
    TextStyle(fontSize: 13.0, color: colorScheme.onSurfaceVariant);

    return Container(
        decoration: BoxDecoration(
            color: colorScheme.surface,
            border: Border.all(color: colorScheme.primaryFixedDim),
            borderRadius: BorderRadius.circular(8.0)),
        child: Row(children: [
          Expanded(
              flex: 6,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Container(color: colorScheme.surfaceContainer))),
          const Spacer(flex: 1),
          Expanded(
              flex: 12,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    Text(place.name,
                        style: titleStyle, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4.0),
                    Text(place.address.value?.lineBreakByWord() ?? '',
                        style: subTitleStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    const Expanded(child: SizedBox()),
                    Wrap(spacing: 8.0, children: [
                      if (rating != null)
                        SmallChip(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: colorScheme.onPrimary,
                            leading: Icon(Icons.star_rate_rounded,
                                color: colorScheme.onPrimary),
                            label: rating.toStringAsFixed(2)),
                      for (final categoryType in place.categoryTypes.take(2))
                        SmallChip(label: enumKey(categoryType).tr()),
                    ]),
                    const SizedBox(height: 16.0),
                  ])),
          const Spacer(flex: 1),
        ]));
  }
}
