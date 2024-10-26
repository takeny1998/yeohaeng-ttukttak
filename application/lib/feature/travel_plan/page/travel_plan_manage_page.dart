
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanManagePage extends ConsumerWidget {

  final int _travelId;

  const TravelPlanManagePage({super.key, required int travelId})
      : _travelId = travelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(delegate: SliverChildListDelegate([]));
  }
}
