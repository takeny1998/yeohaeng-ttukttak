import 'package:application_new/feature/travel_plan/component/travel_plan_home_header.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanHomePage extends ConsumerWidget {
  final int _travelId;

  const TravelPlanHomePage({super.key, required int travelId})
      : _travelId = travelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final travel = ref.watch(travelPlanProvider(_travelId)).detail.travel;

    return SliverList(delegate: SliverChildListDelegate([]));
  }
}
