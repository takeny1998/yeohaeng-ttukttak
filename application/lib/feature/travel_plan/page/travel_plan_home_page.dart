import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanHomePage extends ConsumerWidget {

  const TravelPlanHomePage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SliverList(delegate: SliverChildListDelegate([]));
  }
}
