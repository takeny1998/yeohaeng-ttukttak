import 'package:application_new/common/util/string_extension.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/component/place_metric_list_item.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_state.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/place_recommend_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CityRecommendPlaceView extends StatelessWidget {

  final PlaceRecommendModel placeRecommend;

  const CityRecommendPlaceView({super.key, required this.placeRecommend});

  @override
  Widget build(BuildContext context) {

    final PlaceRecommendModel(:places, :categoryType) = placeRecommend;

    // 외부 Indicator 크기 변동을 위해 높이를 부여
    if (places.isEmpty) {
      return const SizedBox(height: 1.0);
    }

    final trKey = baseKey('travel_plan_recommend');

    const labelStyle = TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600);
    final labelText = trKey('label_place.${categoryType.name}')
        .tr().lineBreakByWord();

    return  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 272.0,
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                  labelText,
                  style: labelStyle,
                  softWrap: true)),
          const SizedBox(height: 16.0),
          SingleChildScrollView(
              child: Column(children: [
                for (final place in places) ...[
                  PlaceMetricListItem(placeMetric: PlaceMetricModel(place: place)),
                  const SizedBox(width: 24.0),
                ],
              ])),
          const SizedBox(height: 48.0),
        ]);
  }
}
