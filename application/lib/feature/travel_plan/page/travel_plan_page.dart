import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanPage extends ConsumerWidget {
  const TravelPlanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      body: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [];
      }, body: CustomScrollView()),
    );
  }
}
