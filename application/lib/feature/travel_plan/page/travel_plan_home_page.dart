import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanHomePage extends ConsumerWidget {
  final TravelModel travel;

  const TravelPlanHomePage({super.key, required this.travel});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SliverList(delegate: SliverChildListDelegate([]));
  }
}
