import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/domain/travel_visit/travel_visit_repository.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/travel_plan_add_view.dart';
import 'package:application_new/shared/component/outlined_icon_button.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/city_place_pois_state.dart';

class PlaceMetricListItem extends ConsumerWidget {
  final TravelModel travel;
  final PlaceMetricModel placeMetric;

  const PlaceMetricListItem(
      {super.key, required this.placeMetric, required this.travel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                constraints: BoxConstraints(maxWidth: deviceWidth * 0.3),
                width: 156.0,
                color: colorScheme.surfaceContainer)),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(place.name, style: titleStyle),
              Text(place.address.value ?? '',
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
                  SmallChip(label: TranslationUtil.enumValue(categoryType)),
              ]),
              const Expanded(child: SizedBox()),
              Row(children: [
                OutlinedButton.icon(
                    onPressed: () => TravelPlanAddView.showSheet(context, travel: travel, place: place),
                    style: buttonStyle,
                    icon:
                        const Icon(Icons.add_location_alt_outlined, size: 18.0),
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
