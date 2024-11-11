import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/feature/travel_read/components/visit_order_item.dart';
import 'package:application_new/feature/travel_read/model/travel_visit_model.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'visit_rating_item.dart';

class VisitListItem extends ConsumerWidget {
  final List<PlaceModel> places;
  final TravelVisitModel visit;

  const VisitListItem({super.key, required this.places, required this.visit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);

    final translator = TranslationUtil.widget(context);

    final place = places.firstWhere((e) => e.id == visit.placeId);

    final PlaceAddress(:road, :lotNumber) = place.address;

    final address = road.isNotEmpty ? road : lotNumber;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (visit.images.isNotEmpty) ...[
          SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for (final image in visit.images) ...[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Container(
                        width: 176,
                        height: 140,
                        color: colorScheme.primaryContainer,
                      )),
                  const SizedBox(width: 8.0)
                ]
              ])),
          const SizedBox(height: 24.0),
        ],
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(width: 24.0),
              Column(children: [
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    VisitOrderItem(order: visit.seq),
                    Expanded(
                        child: Container(
                            width: 2.0, color: colorScheme.secondaryContainer))
                  ],
                ))
              ]),
              const SizedBox(width: 16.0),
              Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(address, style: textTheme.labelMedium),
                      Wrap(
                        spacing: 6.0,
                        children: [
                          for (final categoryType in place.categoryTypes)
                            SmallChip(
                                label: TranslationUtil.enumValue(categoryType))
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(translator.key('ask_reason'),
                                style: textTheme.labelMedium),
                            const SizedBox(height: 2.0),
                            Text(TranslationUtil.enumValue(visit.reasonType),
                                style: textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VisitRatingItem(
                                name: 'satisfaction',
                                rating: visit.rating.satisfaction),
                            const SizedBox(height: 16.0),
                            VisitRatingItem(
                                name: 'revisit', rating: visit.rating.revisit),
                            const SizedBox(height: 16.0),
                            VisitRatingItem(
                                name: 'recommend',
                                rating: visit.rating.recommend),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: OutlinedButton.icon(
                              onPressed: () => {},
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0)),
                                  side: BorderSide(
                                      color: colorScheme.secondaryFixedDim),
                                  textStyle: textTheme.labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w600)),
                              icon: const Icon(Icons.bookmark_outline),
                              label: const Text('저장'),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            flex: 3,
                            child: OutlinedButton(
                              onPressed: () => {},
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  side: BorderSide(
                                      color: colorScheme.secondaryFixedDim),
                                  textStyle: textTheme.labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w600)),
                              child: const Text('일정에 추가하기'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32.0),
                    ],
                  )),
              const SizedBox(width: 24.0),
            ],
          ),
        ),
      ],
    );
  }
}
