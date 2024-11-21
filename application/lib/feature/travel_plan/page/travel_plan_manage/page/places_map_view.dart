import 'dart:async';

import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/feature/travel_read/components/place_marker_item.dart';
import 'package:application_new/shared/component/tonal_filled_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import 'package:collection/collection.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';

class PlacesMapView extends StatefulWidget {
  final EdgeInsets? padding;
  final List<PlaceModel> places;

  const PlacesMapView({super.key, required this.places, this.padding});

  @override
  State<PlacesMapView> createState() => _PlacesMapViewState();
}

class _PlacesMapViewState extends State<PlacesMapView> {
  final MapController mapController = MapController();

  Style? style;

  static const double markerRadius = 32.0;

  PlaceModel? selectedPlace;

  List<Marker> markers = [];
  double zoom = 16.0;

  Future<Style> _readStyle() => StyleReader(
        uri: 'http://127.0.0.1:8081/styles/basic-preview/style.json',
      ).read();

  Completer<bool> mapReadyCompleter = Completer();


  bool isMoving = false;

  @override
  void initState() {
    _readStyle().then((style) => setState(() => this.style = style));
    super.initState();
  }

  List<Marker> _buildMarkers(List<PlaceModel> places) {
    return places.mapIndexed((index, place) {
      final PlaceCoordinates(:longitude, :latitude) = place.coordinates;

      final isSelected = place.id == selectedPlace?.id;

      return Marker(
          width: markerRadius,
          height: markerRadius,
          point: LatLng(latitude, longitude),
          child: PlaceMarkerItem(
              radius: markerRadius,
              place: place, isSelected: isSelected));
    }).toList();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = widget.padding;
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final topPadding =
        MediaQuery.of(context).padding.top + (padding?.top ?? 0.0) + markerRadius;

    markers = _buildMarkers(widget.places);

    mapReadyCompleter.future.then((_) async {

      mapController.fitCamera(CameraFit.coordinates(
          maxZoom: 12.0,
          padding: EdgeInsets.fromLTRB(
            markerRadius + 24.0 + (padding?.left ?? 0),
            topPadding,
            markerRadius + 24.0 + (padding?.right ?? 0),
            48.0 + (padding?.bottom ?? 0),
          ),
          coordinates: markers.map((marker) => marker.point).toList()));
    });

    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
              onMapReady: () => mapReadyCompleter.complete(true),
              maxZoom: 22.0,
              initialZoom: zoom),
          children: [
            if (style != null)
              VectorTileLayer(
                  tileProviders: style!.providers, theme: style!.theme),
            MarkerLayer(markers: markers.reversed.toList()),
          ],
        ),
        Positioned(
            bottom: widget.padding?.bottom ?? 0.0 + 24.0,
            right: 16.0,
            child: Wrap(
              direction: Axis.vertical,
              children: [
                TonalFilledIconButton(
                    iconSize: 21.0,
                    onPressed: () {
                      final MapCamera(:center, :zoom) = mapController.camera;
                      mapController.move(center, zoom + 1.0);
                    },
                    icon: Icon(Icons.add, color: colorScheme.primary)),
                TonalFilledIconButton(
                    iconSize: 21.0,
                    onPressed: () {
                      final MapCamera(:center, :zoom) = mapController.camera;
                      mapController.move(center, zoom - 1.0);
                    },
                    icon: Icon(
                      Icons.remove,
                      color: colorScheme.primary,
                    )),
              ],
            ))
      ],
    );
  }
}
