import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_detail/components/visit_order_item.dart';
import 'package:application_new/feature/travel_detail/model/travel_detail_model.dart';
import 'package:application_new/feature/travel_detail/model/travel_visit_model.dart';
import 'package:application_new/shared/place/model/place_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'visit_rating_item.dart';

class VisitItem extends ConsumerWidget {

  final List<PlaceModel> places;
  final TravelVisitModel visit;

  const VisitItem({super.key, required this.places, required this.visit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final trKey = baseKey('travel.travel_detail');
    final place = places.firstWhere((e) => e.id == visit.placeId);

    return Column(
      children: [
        SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              for (int i = 0; i < 5; i++) ...[
                ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Container(
                      width: 156,
                      height: 140,
                      color: colorScheme.secondaryContainer,
                    )),
                const SizedBox(width: 8.0)
              ]
            ])),
        const SizedBox(height: 24.0),
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
                      Text(
                        '증평군, 충청북도 · 자연관광지',
                        style: textTheme.labelMedium,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(trKey('ask_reason').tr(),
                                style: textTheme.labelMedium),
                            const SizedBox(height: 2.0),
                            Text(enumKey(visit.reason).tr(),
                                style: textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 24.0),
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
                                      borderRadius: BorderRadius.circular(4.0)),
                                  side: BorderSide(
                                      color: colorScheme.secondaryContainer),
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
                                      color: colorScheme.secondaryContainer),
                                  textStyle: textTheme.labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w600)),
                              child: const Text('일정에 추가하기'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
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
