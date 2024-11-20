import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TravelPlanListItem extends ConsumerWidget {
  final int order;
  final TravelVisitWithPlaceModel visitPlace;

  const TravelPlanListItem(
      {super.key, required this.order, required this.visitPlace});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);

    const titleStyle =
        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0, height: 1.0);
    const subTitleStyle = TextStyle(fontSize: 12.0);

    final place = visitPlace.place;

    final categoryName =
        TranslationUtil.enumValue(place.categoryTypes.firstOrNull);

    return IntrinsicHeight(
      child: Row(
        children: [
          const SizedBox(width: 24.0),
          Column(
            children: [
              CircleAvatar(
                  radius: 16.0,
                  backgroundColor: colorScheme.primaryContainer,
                  child: Text('${order + 1}',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: colorScheme.primary))),
              Expanded(
                  child: Container(
                      width: 1.0, color: colorScheme.primaryContainer)),
            ],
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(place.name, style: titleStyle),
                    const SizedBox(width: 6.0),
                    Text(categoryName, style: const TextStyle(fontSize: 12.0)),
                  ],
                ),
                const SizedBox(height: 4.0),
                Text(
                  place.address.value ?? '',
                  style: subTitleStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12.0),
                Wrap(
                  spacing: 8.0,
                  children: [
                    OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.comment_outlined, size: 14.0),
                        label: const Text('댓글 추가', style: TextStyle(fontSize: 13.0))),
                    OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.star_rate_outlined, size: 16.0),
                        label: const Text('리뷰 쓰기', style: TextStyle(fontSize: 13.0))),
                  ],
                ),

                const SizedBox(height: 48.0),
              ],
            ),
          ),
          const SizedBox(width: 24.0),
        ],
      ),
    );
  }
}
