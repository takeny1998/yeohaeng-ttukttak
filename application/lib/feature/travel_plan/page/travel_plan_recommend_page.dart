import 'package:application_new/feature/travel_plan/component/travel_city_item.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/shared/component/fixed_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanRecommendPage extends ConsumerWidget {
  final int _travelId;

  const TravelPlanRecommendPage({super.key, required int travelId})
      : _travelId = travelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(travelPlanProvider(_travelId));
    final travel = state.detail.travel;


    return SliverList(
      delegate: SliverChildListDelegate([
        SingleChildScrollView(
            child: Row(children: [
              for (int i = 0; i < travel.cities.length; i++)
                TravelCityItem(
                    city: travel.cities[i],
                    isSelected: state.cityIndex == i,
                    onSelected: () => ref
                        .read(travelPlanProvider(_travelId).notifier)
                        .selectCity(i)),
            ])),
        Container(
          color: Colors.black,
          width: double.maxFinite,
          height: 3200,
        )
      ]),
    );
  }
}
