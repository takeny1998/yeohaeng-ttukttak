import 'dart:async';

import 'package:application_new/domain/place/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:collection/collection.dart';

import '../provider/city_place_map_provider.dart';

class CityPlacesMap extends ConsumerStatefulWidget {
  final List<PlaceModel> places;
  final double bottomPadding;

  const CityPlacesMap(
      {super.key, required this.places, this.bottomPadding = 0.0});

  @override
  ConsumerState createState() => _CityPlacesMapState();
}

class _CityPlacesMapState extends ConsumerState<CityPlacesMap> {
  final MapController mapController = MapController();

  final double markerRadius = 26.0;
  double zoom = 16.0;

  List<Marker> markers = [];

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  Future<void> moveToPlace(PlaceModel? place) async {
    if (place == null) return;

    final PlaceCoordinates(:latitude, :longitude) = place.coordinates;

    final bottomPadding = (widget.bottomPadding / 2);

    mapController.move(LatLng(latitude, longitude), zoom,
        offset: Offset(0, -bottomPadding + (markerRadius / 2)));
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    final markers = ref.watch(cityPlaceMapProvider(widget.places)).markers;

    ref.listen(cityPlaceMapProvider(widget.places), (prev, next) {
      if (prev?.selectedId == next.selectedId) return;

      mapController.fitCamera(CameraFit.coordinates(
          padding: EdgeInsets.fromLTRB(16.0, topPadding, 16.0, 48.0),
          coordinates: markers.map((marker) => marker.point).toList()));

      final place = widget.places
          .firstWhereOrNull((place) => place.id == next.selectedId);

      moveToPlace(place);
    });

    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
              onMapReady: () => moveToPlace(widget.places.first),
              maxZoom: 22.0,
              initialZoom: zoom),
          children: [
            TileLayer(urlTemplate: 'http://127.0.0.1:8081/tile/{z}/{x}/{y}.png'),
            MarkerLayer(markers: markers.reversed.toList()),
          ],
        ),
        Positioned(
            bottom: widget.bottomPadding + 24.0,
            right: 16.0,
            child: Wrap(
              direction: Axis.vertical,
              children: [
                IconButton.filled(
                    onPressed: () {
                      final MapCamera(:center, :zoom) = mapController.camera;
                      mapController.move(center, zoom + 1.0);
                    },
                    icon: const Icon(Icons.add)),
                IconButton.filled(
                    onPressed: () {
                      final MapCamera(:center, :zoom) = mapController.camera;
                      mapController.move(center, zoom - 1.0);
                    },
                    icon: const Icon(Icons.remove)),
              ],
            ))
      ],
    );
  }
}
