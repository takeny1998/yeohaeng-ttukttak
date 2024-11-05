import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/home/home_page.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/component/city_place_list_item.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CityPlacePoisPage extends ConsumerStatefulWidget {
  final int cityId;

  const CityPlacePoisPage({super.key, required this.cityId});

  @override
  ConsumerState createState() => _CityPlaceListPageState();
}

class _CityPlaceListPageState extends ConsumerState<CityPlacePoisPage> {
  final scrollController = ScrollController();

  bool hasScrollDown = false;
  PlaceSortType sortType = PlaceSortType.rating;

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

    final CityPlacePoisState(
      :placeMetrics,
      :hasNextPage,
    ) = ref.watch(cityPlacePoisProvider(cityId, sortType));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.surface,
          scrolledUnderElevation: 0.0,
          title: const Text('목록'),
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
                  onPressed: () async {
                    final sortType = await showSortTypeSelectSheet();

                    if (sortType == null) return;
                    setState(() => this.sortType = sortType);
                  },
                  child: Row(children: [
                    Text(enumKey(sortType).tr(),
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
                    ref
                        .read(cityPlacePoisProvider(cityId, sortType).notifier)
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

  Future<PlaceSortType?> showSortTypeSelectSheet() async {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    return showModalBottomSheet<PlaceSortType>(
        context: context,
        isScrollControlled: true,
        builder: (context) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Row(children: [
                    SizedBox(width: 24.0),
                    Text('정렬 옵션',
                        style: TextStyle(
                            fontSize: 21.0, fontWeight: FontWeight.w600))
                  ]),
                  const SizedBox(height: 16.0),
                  for (final sortType in PlaceSortType.values)
                    ListTile(
                        selected: sortType == this.sortType,
                        selectedColor: colorScheme.primary,
                        selectedTileColor: colorScheme.primaryContainer,
                        trailing: sortType == this.sortType
                            ? const Icon(Icons.check_box)
                            : const Icon(Icons.check_box_outline_blank),
                        onTap: () => Navigator.of(context).pop(sortType),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 24.0),
                        title: Text(enumKey(sortType).tr()),
                        titleTextStyle: textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                ]),
              ),
            ));
  }
}
