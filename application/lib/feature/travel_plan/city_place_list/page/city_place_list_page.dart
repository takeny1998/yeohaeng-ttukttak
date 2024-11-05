import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_plan/city_place_list/component/city_place_list_item.dart';
import 'package:application_new/feature/travel_plan/city_place_list/provider/city_place_list_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_list/provider/city_place_list_state.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CityPlacePoisPage extends ConsumerStatefulWidget {
  final int cityId;

  const CityPlacePoisPage(
      {super.key, required this.cityId});

  @override
  ConsumerState createState() => _CityPlaceListPageState();
}

class _CityPlaceListPageState extends ConsumerState<CityPlacePoisPage> {
  final scrollController = ScrollController();

  bool hasScrollDown = false;

  static const double scrollThreshold = 240.0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset <= scrollThreshold) {
        setState(() => hasScrollDown = false);
        return;
      }
      setState(() => hasScrollDown = true);
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final cityId = widget.cityId;

    final CityPlaceListState(:placeMetrics, :hasNextPage, :viewType) =
        ref.watch(cityPlaceListProvider(cityId));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.surface,
          scrolledUnderElevation: 0.0,
          title: Text('목록'),
        ),
        floatingActionButton: hasScrollDown
            ? FloatingActionButton(
                child: const Icon(Icons.arrow_upward),
                onPressed: () => scrollController.animateTo(0.0,
                    duration: Duration(
                        milliseconds: (scrollController.offset / 5).toInt()),
                    curve: Curves.linear))
            : null,
        body: CustomScrollView(controller: scrollController, slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
          SliverToBoxAdapter(
            child: Row(children: [
              const SizedBox(width: 16.0),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: colorScheme.onSurface),
                  onPressed: () {},
                  child: Row(children: [
                    Text('평점 높은 순',
                        style: textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    const Icon(Icons.arrow_drop_down),
                  ]))
            ]),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      CityPlaceListItem(placeMetric: placeMetrics[index]),
                  childCount: placeMetrics.length)),
          if (hasNextPage)
            SliverFillRemaining(
                hasScrollBody: false,
                child: VisibilityDetector(
                  key: const Key('key'),
                  onVisibilityChanged: (VisibilityInfo info) {
                    final isVisible = info.visibleFraction > 0.0;
                    if (!isVisible) return;
                    ref.read(cityPlaceListProvider(cityId).notifier)
                        .fetch();
                  },
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 120.0),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                )),
          const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
        ]));
  }
}
