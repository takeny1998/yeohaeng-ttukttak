import 'dart:async';
import 'dart:math';

import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/domain/geo_json/geo_json_model.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/geography_select/components/geography_select_button.dart';
import 'package:application_new/feature/geography_select/polygon_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'geography_select_provider.dart';
import 'geography_select_state.dart';

class GeographySelectView extends ConsumerStatefulWidget {
  final int id;

  final FutureOr<void> Function(GeographyModel model) onSelect;
  final VoidCallback? onCancel;

  final GeographyModel? initialActiveChild;
  final Iterable<GeographyModel> selectedChildren;

  final bool isUnSelectable;

  const GeographySelectView(
      {super.key,
      required this.id,
      required this.onSelect,
      required this.selectedChildren,
        this.initialActiveChild,
      this.onCancel,
      this.isUnSelectable = true});

  @override
  ConsumerState createState() => _StateSelectViewState();
}

class _StateSelectViewState extends ConsumerState<GeographySelectView> {
  final Completer<void> onMapReadyCompleter = Completer();
  final Completer<void> onPageViewReadyCompleter = Completer();

  final LayerHitNotifier hitNotifier = ValueNotifier(null);

  final MapController mapController = MapController();

  late final PageController pageController;

  Iterable<Polygon>? activePolygons;
  Iterable<Polygon>? polygons;

  Iterable<Polygon>? selectPolygons;

  @override
  void initState() {
    pageController = PageController(onAttach: (position) {
      if (onPageViewReadyCompleter.isCompleted) return;
      onPageViewReadyCompleter.complete();
    });

    Future.microtask(() async {
      await onMapReadyCompleter.future;
      hitNotifier.addListener(() async {
        final hitId = hitNotifier.value?.hitValues.lastOrNull;
        if (hitId == null) return;

        final child = await ref.read(geographyProvider(hitId as int).future);

        ref.read(geographySelectProvider(widget.id).notifier).active(child);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    pageController.dispose();
    hitNotifier.dispose();
    super.dispose();
  }

  void init(GeoJsonModel geoJson, Iterable<GeographyModel> children) async {
    final parser = GeoJsonParser(
      polygonCreationCallback: PolygonUtil.createPolygonCallback(
          context, (id) => children.where((e) => e.id == id).first.shortName),
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
          borderColor: colorScheme.onPrimaryFixedVariant,
          color: colorScheme.primary,
          labelStyle: TextStyle(color: colorScheme.onPrimary),
        ));
  }

  void readySelectPolygon(Iterable<int> selectedItems) {
    if (polygons == null) return;

    final foundPolygons = polygons!.where(
        (polygon) => selectedItems.any((item) => item == polygon.hitValue));
    ;

    final colorScheme = Theme.of(context).colorScheme;
    selectPolygons = foundPolygons.map((polygon) => PolygonUtil.copyWith(
          polygon,
          borderColor: colorScheme.primary,
          color: colorScheme.primaryContainer,
        ));
  }

  void movePage(int targetIndex) async {
    await onPageViewReadyCompleter.future;

    final curtIndex = pageController.page!.toInt();

    if (curtIndex == targetIndex) return;

    final mills = ((targetIndex - curtIndex).abs()) * 250;

    pageController.animateToPage(targetIndex,
        duration: Duration(milliseconds: mills), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(geographySelectProvider(widget.id));
    final tr = ref.watch(translationServiceProvider);

    final colorScheme = Theme.of(context).colorScheme;

    return asyncState.when(
        data: (state) {
          final GeographySelectState(
            :activeChild,
            :model,
            :children,
          ) = state;
          if (polygons == null) {
            init(model, children);
          }
          final curtActiveChild = activeChild ?? widget.initialActiveChild;

          readyActivePolygon(curtActiveChild?.id);
          readySelectPolygon(widget.selectedChildren.map((child) => child.id));

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
              child: LayoutBuilder(builder: (context, constraints) {
                const double buttonWidth = 120.0;
                const double buttonHeight = 56.0;

                const double indicatorHeight = 48.0;

                final maxHeight = (constraints.maxHeight - indicatorHeight);
                final int usableHeight = (maxHeight * 0.25).floor();

                final int columnCount =
                    min((constraints.maxWidth / buttonWidth).floor(), 5);
                final int rowCount = (usableHeight / buttonHeight).floor();

                final int itemsPerPage = rowCount * columnCount;
                final int pageCount = (children.length / itemsPerPage).ceil();


                if (curtActiveChild != null) {
                  final index = children.indexOf(curtActiveChild);

                  movePage((index / itemsPerPage).floor());
                }

                return Column(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth,
                      height: maxHeight - usableHeight,
                      child: FlutterMap(
                          mapController: mapController,
                          options: MapOptions(
                            interactionOptions: const InteractionOptions(
                                flags: InteractiveFlag.none),
                            backgroundColor: colorScheme.surface,
                            onMapReady: () {
                              if (onMapReadyCompleter.isCompleted) return;
                              onMapReadyCompleter.complete();
                            },
                          ),
                          children: [
                            PolygonLayer(
                                hitNotifier: hitNotifier,
                                simplificationTolerance: 0.0,
                                polygons: [
                                  ...?polygons,
                                  ...?selectPolygons,
                                  ...?activePolygons,
                                ]),
                          ]),
                    ),
                    SizedBox(
                      width: constraints.maxWidth,
                      height: indicatorHeight,
                      child: Center(
                        child: SmoothPageIndicator(
                            controller: pageController, // PageController
                            count: pageCount,
                            effect: WormEffect(
                              dotColor: colorScheme.surfaceContainerHighest,
                              activeDotColor: colorScheme.primary,
                            ), // your preferred effect
                            onDotClicked: movePage),
                      ),
                    ),
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
                                    GeographySelectButton(
                                        width: buttonWidth,
                                        height: buttonHeight,
                                        label: child.shortName,
                                        isActive: child == curtActiveChild,
                                        isSelected: widget.selectedChildren
                                            .contains(child),
                                        onPressed: () => ref
                                            .read(geographySelectProvider(
                                                    widget.id)
                                                .notifier)
                                            .active(child))
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
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
                            child: Text(tr.from('Cancel')))),
                  const SizedBox(width: 8.0),
                  Expanded(
                      child: FilledButton(
                          onPressed: curtActiveChild != null
                              ? () => widget.onSelect(curtActiveChild)
                              : null,
                          child: Text(
                              widget.selectedChildren.contains(activeChild) &&
                                      widget.isUnSelectable
                                  ? tr.from('Unselect')
                                  : tr.from('Select')))),
                ],
              ),
            ),
          );
        },
        error: (error, _) => throw error,
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
