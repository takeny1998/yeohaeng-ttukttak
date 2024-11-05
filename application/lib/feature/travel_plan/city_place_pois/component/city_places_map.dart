import 'package:application_new/feature/travel_read/components/place_marker_item.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CityPlacesMap extends StatefulWidget {
  final List<PlaceModel> places;

  const CityPlacesMap({super.key, required this.places});

  @override
  State<CityPlacesMap> createState() => _CityPlacesMapState();
}

class _CityPlacesMapState extends State<CityPlacesMap> {
  final MapController mapController = MapController();

  final double markerRadius = 26.0;
  double zoom = 15.0;

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final markers = _buildMarkers(widget.places);

    if (markers.isNotEmpty) {
      mapController.fitCamera(CameraFit.coordinates(
          padding: EdgeInsets.fromLTRB(16.0, MediaQuery.of(context).padding.top,
              16.0, 48.0),
          coordinates: markers.map((marker) => marker.point).toList()));
    }

    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            ),
            MarkerLayer(markers: markers.reversed.toList()),
          ],
        ),
        Positioned(
            bottom: 24.0,
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

  List<Marker> _buildMarkers(List<PlaceModel> places) {
    return places.map((place) {
      final PlaceCoordinates(:longitude, :latitude) = place.coordinates;
      return Marker(
          width: markerRadius,
          height: markerRadius,
          point: LatLng(latitude, longitude),
          child: PlaceMarkerItem(place: place, isSelected: true));
    }).toList();
  }
}
