import 'package:application_new/common/util/string_extension.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_state.dart';
import 'package:application_new/shared/component/outlined_icon_button.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:application_new/shared/util/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';

class PlaceMetricListItem extends StatelessWidget {
  final PlaceMetricModel placeMetric;

  const PlaceMetricListItem({super.key, required this.placeMetric});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);
    final PlaceMetricModel(:place, :rating) = placeMetric;

    final titleStyle =
        textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);
    final subTitleStyle =
        TextStyle(fontSize: 12.0, color: colorScheme.onSurfaceVariant);

    var buttonStyle = OutlinedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
        backgroundColor: colorScheme.surface);

    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 168.0,
      constraints: const BoxConstraints(maxWidth: 640.0),
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: deviceWidth * 0.3),
                width: 156.0,
                color: colorScheme.surfaceContainer)),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(place.name, style: titleStyle),
              Text(place.address.value?.lineBreakByWord() ?? '',
                  style: subTitleStyle, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 4.0),
              ExtendedWrap(maxLines: 1, spacing: 8.0, children: [
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
              const Expanded(child: SizedBox()),
              Row(children: [
                OutlinedButton.icon(
                    onPressed: () {},
                    style: buttonStyle,
                    icon: const Icon(Icons.add_location_alt_outlined,
                        size: 18.0),
                    label: const Text('일정에 추가')),
                const SizedBox(width: 8.0),
                const OutlinedIconButton(icon: Icon(Icons.bookmark_outline)),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}
