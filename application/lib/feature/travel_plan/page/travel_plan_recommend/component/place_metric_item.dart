import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/common/util/string_extension.dart';
import 'package:application_new/shared/component/outlined_icon_button.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../page/city_place_pois/provider/city_place_pois_state.dart';

class PlaceMetricItem extends ConsumerWidget {

  final PlaceMetricModel placeMetric;

  const PlaceMetricItem({super.key, required this.placeMetric});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final PlaceMetricModel(:place, :rating) = placeMetric;

    final tr = ref.watch(translationServiceProvider);

    final nameStyle =
        textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600);

    final addrStyle = textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w600);

    var buttonStyle = OutlinedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
        backgroundColor: colorScheme.surface);

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
      const SizedBox(height: 8.0),
      ExtendedWrap(spacing: 8.0, maxLines: 1, children: [
        if (rating != null)
          SmallChip(
            borderColor: colorScheme.primaryFixedDim,
              backgroundColor: colorScheme.primaryContainer,
              foregroundColor: colorScheme.primary,
              leading:
                  Icon(Icons.star_rate_rounded, color: colorScheme.primary),
              label: rating.toStringAsFixed(2)),
        for (int i = 0; i < place.categoryTypes.length; i++)
          SmallChip(
              label: tr.fromEnum(place.categoryTypes[i])),
      ]),
      const SizedBox(height: 12.0),
      Row(children: [
        Expanded(
          child: OutlinedButton.icon(
              onPressed: () {},
              style: buttonStyle,
              icon: const Icon(Icons.add_location_alt_outlined,
                  size: 18.0),
              label: Text(tr.from('add_to_your_plan'))),
        ),
        const SizedBox(width: 8.0),
        const OutlinedIconButton(
            icon: Icon(Icons.bookmark_outline)),
      ]),
    ]);
  }
}
