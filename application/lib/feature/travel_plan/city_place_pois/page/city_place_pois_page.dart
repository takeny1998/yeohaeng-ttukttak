import 'dart:async';
import 'dart:math';

import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/component/place_metric_list_item.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/component/city_places_map.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/component/place_metric_card_indicator.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/component/place_metric_card_item.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_map_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_state.dart';
import 'package:application_new/shared/component/sliver_infinite_list_indicator.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:application_new/shared/util/constants.dart';
import 'package:application_new/shared/util/snap_scroll_physics.dart';
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
  final pageController = PageController(viewportFraction: 0.9);

  bool hasScrollDown = false;
  PlaceSortType sortType = PlaceSortType.rating;
  PlaceViewType viewType = PlaceViewType.list;

  static const double scrollThreshold = 240.0;

  final Set<PlaceCategoryType> selectedTypes = {};

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset <= scrollThreshold) {
        if (!hasScrollDown) return;
        setState(() => hasScrollDown = false);
        return;
      }
      if (hasScrollDown) return;
      setState(() => hasScrollDown = true);
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final translator = TranslationUtil.widget(context);

    final cityId = widget.cityId;

    final state = ref.watch(cityPlacePoisProvider(cityId, sortType));

    if (state == null) return LoadingPage();

    final CityPlacePoisState(:placeMetrics, :hasNextPage) = state;

    final data = selectedTypes.isNotEmpty
        ? placeMetrics
            .where((placeMetric) => selectedTypes
                .intersection(placeMetric.place.categoryTypes.toSet())
                .isNotEmpty)
            .toList()
        : placeMetrics;

    final bottomPadding = MediaQuery.of(context).padding.bottom + 16.0;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.surface,
          scrolledUnderElevation: 0.0,
          title: const Text('목록'),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(72.0),
              child: Container(
                  height: 73.0,
                  decoration: BoxDecoration(
                      color: colorScheme.surface,
                      border: Border(
                          top: BorderSide(
                              color: colorScheme.surfaceContainerHigh))),
                  child: Center(child: buildSelectTypeView()))),
        ),
        floatingActionButton: hasScrollDown
            ? FloatingActionButton(
                child: const Icon(Icons.arrow_upward),
                onPressed: () => scrollController.animateTo(0.0,
                    duration: Duration(
                        milliseconds: (scrollController.offset / 5).toInt()),
                    curve: Curves.linear))
            : null,
        body: Stack(
          children: [
            Positioned.fill(
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: switch (viewType) {
                      PlaceViewType.list =>
                        buildListView(data, state.hasNextPage),
                      PlaceViewType.map => buildMapView(data, bottomPadding,
                          state.placeMetrics, state.hasNextPage)
                    })),
            Positioned(
                left: 0,
                right: 0,
                bottom: bottomPadding,
                child: Center(child: buildToggleViewButton()))
          ],
        ));
  }

  Stack buildMapView(List<PlaceMetricModel> data, double bottomPadding,
      List<PlaceMetricModel> placeMetrics, bool hasNextPage) {
    final screenSize = MediaQuery.of(context).size.width;

    const cardHeight = 152.0;
    final itemWidth = min(screenSize, Constants.maxItemWidth);

    final bottomPadding = MediaQuery.of(context).padding.bottom + 16.0;

    final places = data.map((placeMetric) => placeMetric.place).toList();

    return Stack(alignment: Alignment.bottomCenter, children: [
      CityPlacesMap(
          places: places,
          bottomPadding: bottomPadding + 50.0 + cardHeight + 24.0),
      Container(
        height: cardHeight,
        margin: EdgeInsets.only(bottom: bottomPadding + 50.0 + 24.0),
        child: ListView.builder(
            padding: EdgeInsets.only(left: (screenSize - itemWidth) / 2.0),
            physics: SnapScrollPhysics(itemWidth: itemWidth),
            scrollDirection: Axis.horizontal,
            itemCount: hasNextPage ? data.length + 1 : data.length,
            itemBuilder: (context, index) {
              if (index == data.length && hasNextPage) {
                return PlaceMetricCardIndicator(widget.cityId, sortType);
              }
              return VisibilityDetector(
                key: ValueKey<int>(data[index].place.id),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction != 1.0) return;

                  ref
                      .read(cityPlaceMapProvider(places).notifier)
                      .selectPlace(places[index]);
                },
                child: Container(
                    width: itemWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: PlaceMetricCardItem(placeMetric: data[index])),
              );
            }),
      ),
    ]);
  }

  Widget buildListView(List<PlaceMetricModel> data, bool hasNextPage) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final cityId = widget.cityId;

    return Container(
      constraints: BoxConstraints(maxWidth: Constants.maxContentWidth),
      child: CustomScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          color: colorScheme.surface,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: colorScheme.onSurface),
                onPressed: () async {
                  final sortType = await showSortTypeSelectSheet();
                  if (sortType == null) return;
                  setState(() => this.sortType = sortType);
                },
                child: Row(children: [
                  Text(TranslationUtil.enumValue(sortType),
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const Icon(Icons.arrow_drop_down),
                ])),
          ]),
        )),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    PlaceMetricListItem(placeMetric: data[index]),
                childCount: data.length)),
        SliverInfiniteListIndicator(
            hasNextPage: hasNextPage,
            onVisible: ref
                .read(cityPlacePoisProvider(cityId, sortType).notifier)
                .fetch),
        const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
      ]),
    );
  }

  SingleChildScrollView buildSelectTypeView() {
    final translator = TranslationUtil.widget(context);

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          const SizedBox(width: 24.0),
          FilterChip(
              label: Text(translator.key('all_category_type')),
              selected: selectedTypes.isEmpty,
              onSelected: (isSelected) {
                if (!isSelected) return;
                setState(() => selectedTypes.clear());
              }),
          const SizedBox(width: 12.0),
          for (final categoryType in PlaceCategoryType.pois()) ...[
            buildFilterChip(categoryType),
            const SizedBox(width: 12.0),
          ],
          const SizedBox(width: 12.0),
        ]));
  }

  Widget buildToggleViewButton() {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    return Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ToggleButtons(
            fillColor: colorScheme.primaryContainer,
            borderColor: colorScheme.surfaceContainerHighest,
            selectedBorderColor: colorScheme.primaryFixedDim,
            borderRadius: BorderRadius.circular(12.0),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
            onPressed: (index) {
              final viewType = PlaceViewType.values[index];
              if (this.viewType == viewType) return;

              hasScrollDown = false;
              setState(() => this.viewType = viewType);
            },
            isSelected: PlaceViewType.values
                .map((viewType) => viewType == this.viewType)
                .toList(),
            children: [
              for (final viewType in PlaceViewType.values)
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(viewType.iconData, size: 18.0),
                          const SizedBox(width: 8.0),
                          Text(TranslationUtil.enumValue(viewType)),
                        ])),
            ]));
  }

  FilterChip buildFilterChip(PlaceCategoryType categoryType) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final isSelected = selectedTypes.contains(categoryType);
    return FilterChip(
        deleteIcon: Icon(Icons.close, color: colorScheme.onPrimary),
        labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        showCheckmark: false,
        onDeleted: isSelected
            ? () {
                if (!isSelected) return;
                selectedTypes.remove(categoryType);
                setState(() {});
              }
            : null,
        onSelected: (_) {
          if (isSelected) {
            selectedTypes.remove(categoryType);
          } else {
            selectedTypes.add(categoryType);
          }
          setState(() {});
        },
        label: Text(TranslationUtil.enumValue(categoryType)),
        avatar: Icon(categoryType.iconData,
            color: isSelected ? colorScheme.onPrimary : null),
        selected: isSelected);
  }

  Future<PlaceSortType?> showSortTypeSelectSheet() async {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);
    final translator = TranslationUtil.widget(context);

    return showModalBottomSheet<PlaceSortType>(
        context: context,
        isScrollControlled: true,
        builder: (context) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(children: [
                    const SizedBox(width: 24.0),
                    Text(translator.key('require_select_sort_type'),
                        style: const TextStyle(
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
                        title: Text(TranslationUtil.enumValue(sortType)),
                        titleTextStyle: textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                ]),
              ),
            ));
  }
}
