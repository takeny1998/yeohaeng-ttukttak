import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_model.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanListDragItem extends ConsumerWidget {
  final PlaceModel? place;

  const TravelPlanListDragItem({super.key, required this.place});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const titleStyle =
        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0, height: 1.0);
    const subTitleStyle = TextStyle(fontSize: 12.0);

    final categoryName =
        TranslationUtil.enumValue(place?.categoryTypes.firstOrNull);

    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(place?.name ?? '', style: titleStyle),
              const SizedBox(width: 6.0),
              Text(categoryName, style: const TextStyle(fontSize: 12.0)),
            ],
          ),
          Text(
            place?.address.value ?? '',
            style: subTitleStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
