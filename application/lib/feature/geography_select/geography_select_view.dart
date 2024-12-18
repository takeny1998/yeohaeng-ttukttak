import 'dart:convert';

import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/domain/geography/geo_json_model.dart';
import 'package:application_new/domain/geography/geo_json_repository.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/feature/geography_select/geography_select_provider.dart';
import 'package:application_new/feature/geography_select/geography_select_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class GeographySelectView extends ConsumerStatefulWidget {
  const GeographySelectView({super.key});

  @override
  ConsumerState createState() => _GeographySelectViewState();
}

class _GeographySelectViewState extends ConsumerState<GeographySelectView> {
  Map<int, Iterable<Polygon>> statePolygons = {};
  final MapController mapController = MapController();

  Polygon? cityPolygon;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      load();
    });
  }

  Polygon<Object> createPolygon(List<LatLng> points,
      List<List<LatLng>>? holePointsList, Map<String, dynamic> properties) {
    final colorScheme = Theme.of(context).colorScheme;

    return Polygon<int>(
      hitValue: properties['id'],
      points: points,
      holePointsList: holePointsList,
      borderColor: colorScheme.onSurface,
      color: colorScheme.surface,
      borderStrokeWidth: 0.5,
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  void load() async {
    final models = await ref.read(geoJsonRepositoryProvider).load();

    final entries = models.map((e) {
      final parser = GeoJsonParser(polygonCreationCallback: createPolygon)
        ..parseGeoJson(e.geoJson);

      return MapEntry(e.id, parser.polygons);
    });

    setState(() {
      statePolygons = Map.fromEntries(entries);
    });
  }

  void initPolygons(List<GeoJsonModel> geoJsons) {
    final entries = geoJsons.map((geoJson) {
      final parser = GeoJsonParser(polygonCreationCallback: createPolygon)
        ..parseGeoJson(geoJson.geoJson);

      return MapEntry(geoJson.id, parser.polygons);
    });

    statePolygons = Map.fromEntries(entries);
  }

  void loadCityPolygon(int? selectedStateId, int? selectedCityId) {
    final colorScheme = Theme.of(context).colorScheme;

    final statePolygon = statePolygons[selectedStateId];
    if (statePolygon == null) return;

    final cityPolygon = statePolygon
        .where((polygon) => polygon.hitValue == selectedCityId)
        .firstOrNull;

    if (cityPolygon == null) return;

    this.cityPolygon = Polygon<int>(
        hitValue: cityPolygon.hitValue as int,
        points: cityPolygon.points,
        holePointsList: cityPolygon.holePointsList,
        borderColor: colorScheme.primary,
        color: colorScheme.primaryContainer,
        borderStrokeWidth: 2.0);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(geographySelectProvider, (prev, next) {
      if (prev?.value?.selectedCityId == next.value?.selectedCityId) {
        final statePolygon = statePolygons[next.value?.selectedStateId];

        if (statePolygon != null) {
          final points = statePolygon
              .map((polygon) => polygon.points)
              .expand((points) => points)
              .toList();

          mapController.fitCamera(CameraFit.coordinates(coordinates: points));
        }
      }
    });

    final state = ref.watch(geographySelectProvider);

    return state.when(
        data: (data) {
          final GeographySelectState(
            :geoJsons,
            :selectedCityId,
            :selectedStateId
          ) = data;

          if (statePolygons.isEmpty) {
            initPolygons(geoJsons);
          }

          loadCityPolygon(selectedStateId, selectedCityId);

          return Column(
            children: [
              Expanded(
                child: FlutterMap(
                    mapController: mapController,
                    options: const MapOptions(
                        initialZoom: 9.0,
                        initialCenter: LatLng(36.6424341, 127.4890319)),
                    children: [
                      for (final polygon in statePolygons.entries)
                        if (polygon.key == selectedStateId)
                          PolygonLayer(polygons: polygon.value.toList()),
                      if (cityPolygon != null)
                        PolygonLayer(polygons: [cityPolygon!])
                    ]),
              ),
              Column(
                children: [
                  TextField(
                    onSubmitted: (string) {
                      final id = int.tryParse(string);
                      if (id == null) return;
                      ref
                          .read(geographySelectProvider.notifier)
                          .selectState(id);
                    },
                  ),
                  TextField(onSubmitted: (string) {
                    final id = int.tryParse(string);
                    if (id == null) return;
                    ref.read(geographySelectProvider.notifier).selectCity(id);
                  }),
                ],
              )
            ],
          );
        },
        error: (error, _) => throw error,
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
