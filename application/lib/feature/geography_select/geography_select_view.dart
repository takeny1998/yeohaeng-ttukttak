import 'dart:async';
import 'dart:math';

import 'package:application_new/domain/geo_json/geo_json_model.dart';
import 'package:application_new/feature/geography_select/polygon_util.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'geography_select_provider.dart';
import 'geography_select_state.dart';

class GeographySelectView extends ConsumerStatefulWidget {
  final int id;

  final void Function(int id) onSelect;
  final VoidCallback? onCancel;

  const GeographySelectView(
      {super.key, required this.id, required this.onSelect, this.onCancel});

  @override
  ConsumerState createState() => _StateSelectViewState();
}

class _StateSelectViewState extends ConsumerState<GeographySelectView> {
  final Completer<void> onMapReadyCompleter = Completer();

  final MapController mapController = MapController();
  final PageController pageController = PageController();

  Iterable<Polygon>? activePolygons;
  Iterable<Polygon>? polygons;

  @override
  void dispose() {
    mapController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void init(GeoJsonModel geoJson) async {
    final parser = GeoJsonParser(
      polygonCreationCallback: PolygonUtil.createPolygonCallback(context),
    )..parseGeoJson(geoJson.geoJson);

    polygons = parser.polygons;

    final points = polygons?.map((e) => e.points).expand((e) => e).toList();

    if (points != null) {
      await onMapReadyCompleter.future;
      mapController.fitCamera(CameraFit.coordinates(coordinates: points));
    }
  }

  void readyActivePolygon(int? selectedId) {
    if (polygons == null || selectedId == null) return;

    final foundPolygons = polygons?.where((e) => e.hitValue == selectedId);

    if (foundPolygons == null) return;

    final colorScheme = Theme.of(context).colorScheme;
    activePolygons = foundPolygons.map((polygon) => PolygonUtil.copyWith(
          polygon,
          borderColor: colorScheme.primary,
          color: colorScheme.primaryContainer,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(geographySelectProvider(widget.id));
    final colorScheme = Theme.of(context).colorScheme;

    return asyncState.when(
        data: (state) {
          final GeographySelectState(:activeId, :model, :children) = state;
          if (polygons == null) {
            init(model);
          }
          readyActivePolygon(activeId);

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
              child: LayoutBuilder(builder: (context, constraints) {
                const double buttonWidth = 120.0;
                const double buttonHeight = 56.0;

                const double gapHeight = 24.0;
                const double indicatorHeight = 48.0;

                final maxHeight =
                    (constraints.maxHeight - gapHeight - indicatorHeight);
                final int usableHeight = (maxHeight * 0.33).floor();

                final int columnCount =
                    min((constraints.maxWidth / buttonWidth).floor(), 5);
                final int rowCount = (usableHeight / buttonHeight).floor();

                final int itemsPerPage = rowCount * columnCount;
                final int pageCount = (children.length / itemsPerPage).ceil();

                return Column(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth,
                      height: maxHeight - usableHeight,
                      child: IgnorePointer(
                        child: FlutterMap(
                            mapController: mapController,
                            options: MapOptions(
                              backgroundColor: colorScheme.surface,
                              onMapReady: () {
                                if (onMapReadyCompleter.isCompleted) return;
                                onMapReadyCompleter.complete();
                              },
                            ),
                            children: [
                              if (polygons != null)
                                PolygonLayer(
                                    simplificationTolerance: 0.0,
                                    polygons: polygons!.toList()),
                              if (activePolygons != null)
                                PolygonLayer(
                                    simplificationTolerance: 0.0,
                                    polygons: activePolygons!.toList()),
                            ]),
                      ),
                    ),
                    const SizedBox(height: gapHeight),
                    Container(
                      width: constraints.maxWidth,
                      height: usableHeight.toDouble(),
                      constraints: const BoxConstraints(maxWidth: 480.0),
                      child: PageView(
                        controller: pageController,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          for (int i = 0; i < pageCount; i++)
                            Center(
                              child: Wrap(
                                runAlignment: WrapAlignment.start,
                                spacing: -0.5,
                                runSpacing: -0.5,
                                children: [
                                  for (final child in children.sublist(
                                      (itemsPerPage * i),
                                      min((itemsPerPage * i) + itemsPerPage,
                                          children.length)))
                                    SizedBox(
                                      width: buttonWidth,
                                      height: buttonHeight,
                                      child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            visualDensity:
                                                VisualDensity.compact,
                                            backgroundColor:
                                                activeId == child.id
                                                    ? colorScheme.primaryFixed
                                                    : null,
                                            side: BorderSide(
                                                width: 0.5,
                                                color: colorScheme
                                                    .surfaceContainerHighest),
                                            shape:
                                                const BeveledRectangleBorder(),
                                          ),
                                          onPressed: () => ref
                                              .read(geographySelectProvider(
                                                      widget.id)
                                                  .notifier)
                                              .active(child.id),
                                          child: Text(child.shortName)),
                                    )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: constraints.maxWidth,
                        height: indicatorHeight,
                        child: Center(
                            child: SmoothPageIndicator(
                                controller: pageController, // PageController
                                count: pageCount,
                                effect: WormEffect(
                                  dotColor: colorScheme.primaryContainer,
                                  activeDotColor: colorScheme.primary,
                                ), // your preferred effect
                                onDotClicked: (targetIndex) {
                                  final curtIndex =
                                      pageController.page!.toInt();

                                  if (curtIndex == targetIndex) return;

                                  final mills =
                                      ((targetIndex - curtIndex).abs()) * 250;

                                  pageController.animateToPage(targetIndex,
                                      duration: Duration(milliseconds: mills),
                                      curve: Curves.easeInOut);
                                })))
                  ],
                );
              }),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.onCancel != null)
                    Expanded(
                        child: OutlinedButton(
                            onPressed: widget.onCancel,
                            child: const Text('이전'))),
                  const SizedBox(width: 8.0),
                  Expanded(
                      child: FilledButton(
                          onPressed: activeId != null
                              ? () => widget.onSelect(activeId)
                              : null,
                          child: const Text('선택'))),
                ],
              ),
            ),
          );
        },
        error: (error, _) => throw error,
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
