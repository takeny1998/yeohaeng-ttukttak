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

  final GeoJsonModel geoJson;

  const GeographySelectView({super.key, required this.geoJson});

  @override
  ConsumerState createState() => _StateSelectViewState();
}

class _StateSelectViewState extends ConsumerState<GeographySelectView> {
  final Completer<void> onMapReadyCompleter = Completer();

  final MapController mapController = MapController();

  Polygon? selectedPolygon;
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

    final points =
        polygons?.map((e) => e.points).expand((e) => e).toList();

    if (points != null) {
      await onMapReadyCompleter.future;
      mapController.fitCamera(CameraFit.coordinates(coordinates: points));
    }
  }

  void readySelectedPolygon(int? selectedId) {
    if (polygons == null || selectedId == null) return;

    final polygon =
        polygons?.where((e) => e.hitValue == selectedId).firstOrNull;

    if (polygon == null) return;

    final colorScheme = Theme.of(context).colorScheme;
    selectedPolygon = PolygonUtil.copyWith(
      polygon,
      borderColor: colorScheme.primary,
      color: colorScheme.primaryContainer,
    );
  }

  @override
  Widget build(BuildContext context) {
    final geoJson = widget.geoJson;
    final state = ref.watch(geographySelectProvider(geoJson));

    final GeographySelectState(:selectedId) = state;
    if (polygons == null) {
      init(geoJson);
    }
    readySelectedPolygon(selectedId);

    return Column(
      children: [
        Expanded(
          child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                  onMapReady: () => onMapReadyCompleter.complete()),
              children: [
                if (polygons != null)
                  PolygonLayer(polygons: polygons!.toList()),
                if (selectedPolygon != null)
                  PolygonLayer(polygons: [selectedPolygon!]),
              ]),
        ),
        Column(
          children: [
            TextField(
              onSubmitted: (string) {
                final id = int.tryParse(string);
                if (id == null) return;
                ref
                    .read(geographySelectProvider(geoJson).notifier)
                    .selectProvince(id);
              },
            ),
          ],
        )
      ],
    );
  }
}
