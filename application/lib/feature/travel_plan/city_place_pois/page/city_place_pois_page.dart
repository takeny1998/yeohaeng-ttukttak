import 'dart:async';

import 'package:application_new/common/util/string_extension.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/home/home_page.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/component/city_place_list_item.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/component/city_places_map.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/component/place_metric_card_indicator.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/component/place_metric_card_item.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_map_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_provider.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_pois_state.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:application_new/shared/model/place_model.dart';
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
  final pageController = PageController(viewportFraction: 0.9);

  int pageIndex = 0;
  bool hasScrollDown = false;
  PlaceSortType sortType = PlaceSortType.rating;
  PlaceViewType viewType = PlaceViewType.list;

  static const double scrollThreshold = 240.0;

  final Set<PlaceCategoryType> selectedTypes = {};

  static const cardHeight = 160.0;
  final trKey = baseKey('city_place_pois');

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

    final cityId = widget.cityId;

    final CityPlacePoisState(
      :placeMetrics,
      :hasNextPage,
    ) = ref.watch(cityPlacePoisProvider(cityId, sortType));

    final data = selectedTypes.isNotEmpty
        ? placeMetrics
            .where((placeMetric) => selectedTypes
                .intersection(placeMetric.place.categoryTypes.toSet())
                .isNotEmpty)
            .toList()
        : placeMetrics;

    final bottomPadding = MediaQuery.of(context).padding.bottom + 16.0;

    final places =
        placeMetrics.map((placeMetric) => placeMetric.place).toList();

    return Scaffold(
        backgroundColor: colorScheme.surfaceContainer,
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
                      PlaceViewType.list => buildListView(data),
                      PlaceViewType.map =>
                        Stack(alignment: Alignment.bottomCenter, children: [
                          CityPlacesMap(places: places, bottomPadding: bottomPadding + 50.0 + cardHeight + 24.0),
                          Container(
                              height: cardHeight,
                              margin: EdgeInsets.only(
                                  bottom: bottomPadding + 50.0 + 24.0),
                              child: PageView.builder(
                                  controller: pageController,
                                  onPageChanged: (pageIndex) => ref
                                      .read(
                                          cityPlaceMapProvider(places).notifier)
                                      .selectPlace(places[pageIndex]),
                                  itemCount: hasNextPage
                                      ? data.length + 1
                                      : data.length,
                                  itemBuilder: (context, index) {
                                    if (index == data.length && hasNextPage) {
                                      return PlaceMetricCardIndicator(
                                          cityId, sortType);
                                    }
                                    return PlaceMetricCardItem(
                                        placeMetric: data[index]);
                                  })),
                        ])
                    })),
            Positioned(
                left: 0,
                right: 0,
                bottom: bottomPadding,
                child: Center(child: buildToggleViewButton()))
          ],
        ));
  }

  CustomScrollView buildListView(List<PlaceMetricModel> data) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final cityId = widget.cityId;

    final CityPlacePoisState(:hasNextPage) =
        ref.watch(cityPlacePoisProvider(cityId, sortType));

    return CustomScrollView(controller: scrollController, slivers: [
      SliverToBoxAdapter(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        color: colorScheme.surface,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton(
              style:
                  TextButton.styleFrom(foregroundColor: colorScheme.onSurface),
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
              ])),
        ]),
      )),
      SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => CityPlaceListItem(placeMetric: data[index]),
              childCount: data.length)),
      if (hasNextPage)
        SliverFillRemaining(
            hasScrollBody: false,
            child: VisibilityDetector(
              key: const Key('key'),
              onVisibilityChanged: (info) {
                final isVisible = info.visibleFraction > 0.0;
                if (!isVisible) return;
                ref
                    .read(cityPlacePoisProvider(cityId, sortType).notifier)
                    .fetch();
              },
              child: Container(
                color: colorScheme.surface,
                constraints: const BoxConstraints(minHeight: 120.0),
                child: const Center(child: CircularProgressIndicator()),
              ),
            )),
      const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
    ]);
  }

  SingleChildScrollView buildSelectTypeView() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(spacing: 16.0, children: [
          const SizedBox(width: 8.0),
          FilterChip(
              label: Text(trKey('all').tr()),
              selected: selectedTypes.isEmpty,
              onSelected: (isSelected) {
                if (!isSelected) return;
                selectedTypes.clear();
                setState(() {});
              }),
          for (final categoryType in PlaceCategoryType.pois())
            buildFilterChip(categoryType),
          const SizedBox(width: 24.0),
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
                          Text(enumKey(viewType).tr()),
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
        label: Text(enumKey(categoryType).tr()),
        avatar: Icon(categoryType.iconData,
            color: isSelected ? colorScheme.onPrimary : null),
        selected: isSelected);
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
                  Row(children: [
                    const SizedBox(width: 24.0),
                    Text(trKey('sort_by').tr(),
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
                        title: Text(enumKey(sortType).tr()),
                        titleTextStyle: textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                ]),
              ),
            ));
  }
}
