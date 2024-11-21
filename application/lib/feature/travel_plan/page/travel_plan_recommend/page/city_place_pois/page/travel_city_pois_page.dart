import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/shared/component/toggle_view_button_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'travel_city_pois_filter_view.dart';
import 'travel_city_pois_list_view.dart';
import 'travel_city_pois_map_view.dart';
import 'travel_city_pois_sort_type_select_view.dart';

import '../provider/city_place_pois_provider.dart';
import '../provider/city_place_pois_state.dart';

class TravelCityPoisPage extends ConsumerStatefulWidget {
  final int travelId;
  final int cityId;

  const TravelCityPoisPage(
      {super.key, required this.travelId, required this.cityId});

  @override
  ConsumerState createState() => _CityPlaceListPageState();
}

class _CityPlaceListPageState extends ConsumerState<TravelCityPoisPage> {
  final scrollController = ScrollController();
  final pageController = PageController(viewportFraction: 0.9);

  bool hasScrollDown = false;
  PlaceSortType sortType = PlaceSortType.rating;
  ViewType viewType = ViewType.list;

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

    final (travelId, cityId) = (widget.travelId, widget.cityId);

    final state = ref.watch(cityPlacePoisProvider(travelId, cityId, sortType));

    if (state == null) return const LoadingPage();

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
                  child: Center(
                      child: TravelCityPoisFilterView(
                          travelId: travelId,
                          cityId: cityId,
                          sortType: sortType,
                          state: state)))),
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
                      ViewType.list => TravelCityPoisListView(
                          scrollController: scrollController,
                          sortType: sortType,
                          onChangeSortType: () async {
                            final sortType =
                                await TravelCityPoisSortTypeSelectView
                                    .showSheet(context, this.sortType);
                            if (sortType == null) return;
                            setState(() => this.sortType = sortType);
                          },
                          provider: cityPlacePoisProvider(
                              widget.travelId, cityId, sortType),
                          state: state,
                        ),
                      ViewType.map => TravelCityPoisMapView(
                          provider: cityPlacePoisProvider(
                              widget.travelId, cityId, sortType),
                          state: state,
                        )
                    })),
            Positioned(
                left: 0,
                right: 0,
                bottom: bottomPadding,
                child: Center(
                    child: ToggleViewButtonItem(
                        viewTypes: ViewType.values,
                        onToggle: (index) {
                          final viewType = ViewType.values[index];
                          if (this.viewType == viewType) return;

                          hasScrollDown = false;
                          setState(() => this.viewType = viewType);
                        },
                        selectedType: viewType)))
          ],
        ));
  }
}
