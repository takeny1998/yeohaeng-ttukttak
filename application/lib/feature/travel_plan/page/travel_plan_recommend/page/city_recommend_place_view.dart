import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/model/place_recommend_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'city_place_pois/component/place_metric_list_item.dart';
import 'city_place_pois/provider/city_place_pois_state.dart';

class CityRecommendPlaceView extends ConsumerWidget {

  final TravelModel travel;
  final PlaceRecommendModel placeRecommend;

  const CityRecommendPlaceView({super.key, required this.travel, required this.placeRecommend});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlaceRecommendModel(:places, :categoryType) = placeRecommend;

    // 외부 Indicator 크기 변동을 위해 높이를 부여
    if (places.isEmpty) {
      return const SizedBox(height: 1.0);
    }

    final tr = ref.watch(translationServiceProvider);

    const labelStyle = TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600);
    final labelText = tr.from('list_of_recommend.${categoryType.name}');

    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 272.0,
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(labelText, style: labelStyle, softWrap: true)),
          const SizedBox(height: 8.0),
          SingleChildScrollView(
              child: Column(children: [
            for (final place in places) ...[
              PlaceMetricListItem(travel: travel, placeMetric: PlaceMetricModel(place: place)),
              const SizedBox(width: 24.0),
            ],
          ])),
          const SizedBox(height: 48.0),
        ]);
  }
}
