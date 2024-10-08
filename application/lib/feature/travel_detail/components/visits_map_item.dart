import 'package:application_new/feature/travel_detail/components/visit_order_item.dart';
import 'package:application_new/feature/travel_detail/model/travel_visit_model.dart';
import 'package:application_new/shared/place/model/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class VisitsMapItem extends ConsumerStatefulWidget {
  final List<PlaceModel> places;
  final List<TravelVisitModel> visits;
  final int travelId;

  const VisitsMapItem(
      {super.key,
      required this.places,
      required this.visits,
      required this.travelId});

  @override
  ConsumerState createState() => _VisitsMapItemState();
}

class _VisitsMapItemState extends ConsumerState<VisitsMapItem> {
  final MapController mapController = MapController();

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<LatLng> coordinates = [];
    final List<Marker> markers = [];

    for (int i = 0; i < widget.visits.length; i++) {
      final visit = widget.visits[i];
      final place = widget.places.firstWhere((e) => e.id == visit.placeId);

      final point =
          LatLng(place.coordinates.latitude, place.coordinates.longitude);

      coordinates.add(point);
      markers
          .add(Marker(point: point, child: VisitOrderItem(order: visit.seq)));
    }

    if (coordinates.isNotEmpty) {
      try {
        mapController.fitCamera(CameraFit.coordinates(
            coordinates: coordinates, padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 120.0)));
      } catch (e) {}
    }

    return FlutterMap(
      mapController: mapController,
      children: [
        TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",),
        MarkerLayer(markers: markers)
      ],
    );
  }
}
