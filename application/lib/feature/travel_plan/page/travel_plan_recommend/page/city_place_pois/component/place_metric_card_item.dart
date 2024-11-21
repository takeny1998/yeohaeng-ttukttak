
import 'package:application_new/common/util/string_extension.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:flutter/material.dart';

import '../provider/city_place_pois_state.dart';

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
            borderRadius: BorderRadius.circular(16.0)),
        child: Row(children: [
          Expanded(
              flex: 6,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
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
                        overflow: TextOverflow.ellipsis),
                    const Expanded(child: SizedBox()),
                    Wrap(spacing: 8.0, children: [
                      if (rating != null)
                        SmallChip(
                            backgroundColor: colorScheme.primaryContainer,
                            foregroundColor: colorScheme.primary,
                            borderColor: colorScheme.primaryFixedDim,
                            leading: Icon(Icons.star_rate_rounded,
                                color: colorScheme.primary),
                            label: rating.toStringAsFixed(2)),
                      for (final categoryType in place.categoryTypes.take(2))
                        SmallChip(label: TranslationUtil.enumValue(categoryType)),
                    ]),
                    const SizedBox(height: 8.0),
                  ])),
          const Spacer(flex: 1),
        ]));
  }
}
