import 'package:application_new/domain/place/place_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_place_map_state.freezed.dart';

@freezed
class CityPlaceMapState with _$CityPlaceMapState {

  const factory CityPlaceMapState({
    required List<Marker> markers,
    required int selectedId,
  }) = _CityPlaceMapState;

}