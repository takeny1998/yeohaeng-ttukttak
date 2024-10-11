import 'package:application_new/feature/travel_detail/components/place_marker_item.dart';
import 'package:application_new/feature/travel_detail/components/visit_order_item.dart';
import 'package:application_new/feature/travel_detail/model/travel_visit_model.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class VisitsMapItem extends ConsumerStatefulWidget {
  final List<PlaceModel> places;
  final List<TravelVisitModel> visits;
  final int selectedPlaceId;

  const VisitsMapItem(
      {super.key,
      required this.places,
      required this.visits,
      required this.selectedPlaceId});

  @override
  ConsumerState createState() => _VisitsMapItemState();
}

class _VisitsMapItemState extends ConsumerState<VisitsMapItem> {
  final MapController mapController = MapController();

  double zoom = 15.0;

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    const markerRadius = 26.0;

    final List<LatLng> points = [];
    final List<Marker> markers = [];

    for (int i = 0; i < widget.visits.length; i++) {
      final visit = widget.visits[i];
      final place = widget.places.firstWhere((e) => e.id == visit.placeId);

      final PlaceCoordinates(:longitude, :latitude) = place.coordinates;

      final isSelected = visit.placeId == widget.selectedPlaceId;
      final point = LatLng(latitude, longitude);

      points.add(point);

      final marker = Marker(
          width: markerRadius,
          height: markerRadius,
          point: point,
          child: PlaceMarkerItem(place: place, isSelected: isSelected));

      if (isSelected) {
        markers.insert(0, marker);
      } else {
        markers.add(marker);
      }
    }

    final place = widget.selectedPlaceId > 0
        ? widget.places.firstWhere((e) => e.id == widget.selectedPlaceId)
        : widget.places.firstOrNull;

    if (place != null) {
      final PlaceModel(:coordinates) = place;

      mapController.move(
          LatLng(coordinates.latitude, coordinates.longitude), zoom,
          offset: const Offset(0, markerRadius / 2));
    }

    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            ),
            PolylineLayer(polylines: [
              Polyline(
                  points: points,
                  color: colorScheme.secondary,
                  strokeWidth: 3.0,
                  pattern: const StrokePattern.dotted())
            ]),
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
                    final MapCamera(:center) = mapController.camera;
                    mapController.move(center, ++zoom);
                  },
                  icon: const Icon(Icons.add)),
              IconButton.filled(
                  onPressed: () {
                    final MapCamera(:center) = mapController.camera;
                    mapController.move(center, --zoom);
                  },
                  icon: const Icon(Icons.remove)),
            ],
          ),
        ),
      ],
    );
  }
}
