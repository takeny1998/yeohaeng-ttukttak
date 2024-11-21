import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/feature/travel_read/components/place_marker_item.dart';
import 'package:application_new/feature/travel_read/provider/travel_read_provider.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/place/place_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class VisitsMapItem extends ConsumerStatefulWidget {
  final int travelId;

  const VisitsMapItem({super.key, required this.travelId});

  @override
  ConsumerState createState() => _VisitsMapItemState();
}

class _VisitsMapItemState extends ConsumerState<VisitsMapItem> {
  final MapController mapController = MapController();

  final double markerRadius = 26.0;
  double zoom = 15.0;

  bool isPositionChanged = false;

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  Future<void> moveToPlace(PlaceModel? place) async {
    if (place == null) return;

    final PlaceModel(:coordinates) = place;

    mapController.move(
        LatLng(coordinates.latitude, coordinates.longitude), zoom,
        offset: Offset(0, (markerRadius / 2)));

    final notifier = ref.read(travelReadProvider(widget.travelId).notifier);

    notifier.setIsMapMoved(false);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final List<LatLng> points = [];
    final List<Marker> markers = [];

    final state = ref.watch(travelReadProvider(widget.travelId));

    if (state == null) return const LoadingPage();

    final visits = state.selectedVisits;

    for (int i = 0; i < visits.length; i++) {
      final visit = visits[i];
      final place = ref.watch(placeProvider(visit.placeId)).value;

      if (place == null) continue;

      final PlaceCoordinates(:longitude, :latitude) = place.coordinates;

      final isSelected = visit.placeId == state.selectedPlaceId;
      final point = LatLng(latitude, longitude);

      points.add(point);

      final marker = Marker(
          width: markerRadius,
          height: markerRadius,
          point: point,
          child: PlaceWithCategoryMarkerItem(place: place, isSelected: isSelected));

      if (isSelected) {
        markers.insert(0, marker);
      } else {
        markers.add(marker);
      }
    }

    ref.listen(travelReadProvider(widget.travelId), (prev, next) {
      if (next == null || prev?.selectedPlaceId == next.selectedPlaceId) return;

      final place = ref.watch(placeProvider(next.selectedPlaceId)).value;

      moveToPlace(place);
    });

    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(onPositionChanged: (camera, hasGesture) {
            if (!hasGesture) return;

            final notifier =
                ref.read(travelReadProvider(widget.travelId).notifier);

            notifier.setIsMapMoved(true);
          }),
          children: [
            TileLayer(urlTemplate: 'http://127.0.0.1:8081/tile/{z}/{x}/{y}.png'),
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
            )),
        if (state.isMapMoved)
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            child: Align(
              alignment: Alignment.bottomCenter,
                child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh),
                    label: Text('word.reset_camera'.tr(),
                        style: const TextStyle(fontWeight: FontWeight.w600)))),
          )
      ],
    );
  }
}
