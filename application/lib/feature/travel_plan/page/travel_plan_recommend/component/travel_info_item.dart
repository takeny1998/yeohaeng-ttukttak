import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:application_new/shared/component/travel_companion_avatar_item.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';

class TravelInfoItem extends StatelessWidget {
  final TravelModel travel;

  const TravelInfoItem({super.key, required this.travel});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);
    const travelNameStyle =
        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
    final travelDateStyle =
        TextStyle(fontSize: 13.0,  color: colorScheme.onSurfaceVariant);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(travel.formattedName,
                  style: travelNameStyle, overflow: TextOverflow.ellipsis),
              Text(travel.formattedDate, style: travelDateStyle),
            ]),
            Expanded(
              child: ExtendedWrap(
                  alignment: WrapAlignment.end,
                  maxLines: 1,
                  spacing: -21.0,
                  children: [
                    for (final companion in travel.companions)
                      TravelerAvatarItem.companion(companion, radius: 24.0)
                  ]),
            )
          ],
        ),

        const SizedBox(height: 8.0),
        ExtendedWrap(maxLines: 1, spacing: 8.0, children: [
          for (final motivationType in travel.motivationTypes)
            SmallChip(label: TranslationUtil.enumValue(motivationType))
        ]),
      ]
    );
  }
}
