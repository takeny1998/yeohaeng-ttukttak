import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/shared/component/filled_chip_theme.dart';
import 'package:application_new/shared/component/travel_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanPage extends ConsumerWidget {

  final int _travelId;

  const TravelPlanPage({super.key, required int travelId}) : _travelId = travelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(travelPlanProvider(_travelId));

    print(state.detail.travel);

    return FilledChipTheme(
      child: Scaffold(
        body: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [];
        }, body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 307.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: SafeArea(child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, kToolbarHeight, 24.0, 0.0),
                  child: TravelHeader(travel: state.detail.travel),
                )),
              )
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.maxFinite,
                height: 4200,
                color: Colors.red,
              ),
            )
          ],
        )),
      ),
    );
  }
}
