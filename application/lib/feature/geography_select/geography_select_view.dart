import 'dart:async';

import 'package:application_new/domain/geo_json/geo_json_model.dart';
import 'package:application_new/feature/geography_select/polygon_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Polygon? activePolygon;
  Iterable<Polygon>? polygons;

  @override
  void dispose() {
    mapController.dispose();
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

    final polygon =
        polygons?.where((e) => e.hitValue == selectedId).firstOrNull;

    if (polygon == null) return;

    final colorScheme = Theme.of(context).colorScheme;
    activePolygon = PolygonUtil.copyWith(
      polygon,
      borderColor: colorScheme.primary,
      color: colorScheme.primaryContainer,
    );
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(geographySelectProvider(widget.id));

    return asyncState.when(
        data: (state) {
          final GeographySelectState(:activeId, :model) = state;
          if (polygons == null) {
            init(model);
          }
          readyActivePolygon(activeId);
          return Column(
            children: [
              Expanded(
                child: IgnorePointer(
                  child: FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                        onMapReady: () => onMapReadyCompleter.complete(),
                      ),
                      children: [
                        if (polygons != null)
                          PolygonLayer(polygons: polygons!.toList()),
                        if (activePolygon != null)
                          PolygonLayer(polygons: [activePolygon!]),
                      ]),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: widget.onCancel, child: Text('이전'))),
                  const SizedBox(width: 16.0),
                  Expanded(
                      child: FilledButton(
                          onPressed: activeId != null
                              ? () => widget.onSelect(activeId)
                              : null,
                          child: Text('선택'))),
                ],
              )
            ],
          );
        },
        error: (error, _) => throw error,
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
