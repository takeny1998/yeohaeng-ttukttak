import 'package:application_new/feature/travel_plan/city_place_pois/provider/city_place_map_state.dart';
import 'package:application_new/feature/travel_read/components/place_marker_item.dart';
import 'package:application_new/shared/model/place_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:latlong2/latlong.dart';
import 'package:collection/collection.dart';

part 'city_place_map_provider.g.dart';

@riverpod
class CityPlaceMap extends _$CityPlaceMap {

  final double markerRadius = 26.0;

  @override
  CityPlaceMapState build(List<PlaceModel> places) {
    return CityPlaceMapState(markers: _buildMarkers(places, places[0].id), selectedId: places[0].id);
  }

  List<Marker> _buildMarkers(List<PlaceModel> places, int selectedId) {
    return places.mapIndexed((index, place) {
      final PlaceCoordinates(:longitude, :latitude) = place.coordinates;

      final isSelected = place.id == selectedId;

      return Marker(
          width: markerRadius,
          height: markerRadius,
          point: LatLng(latitude, longitude),
          child: PlaceMarkerItem(place: place, isSelected: isSelected));
    }).toList();
  }

  void selectPlace(PlaceModel place) {
    if (state.selectedId == place.id) return;
    state = state.copyWith(selectedId: place.id, markers: _buildMarkers(places, place.id));
  }

}

