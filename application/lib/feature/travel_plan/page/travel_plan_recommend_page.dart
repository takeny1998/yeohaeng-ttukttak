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
    final travel = ref.watch(travelPlanProvider(_travelId)).detail.travel;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
              delegate: FixedHeaderDelegate(
                  extent: 48.0,
                  widget: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final city in travel.cities)
                          Transform.scale(
                            scale: 2.0,
                            child: Checkbox(
                              shape: CircleBorder(),
                              checkColor: Colors.transparent,
                                // activeColor: ,
                                splashRadius: 48.0,
                                value: true, onChanged: (value) {}),
                          )
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
