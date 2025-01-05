import 'package:application_new/core/scroll/infinite_scroll_model.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_city_attraction_state.freezed.dart';

@freezed
class TravelCityAttractionState with _$TravelCityAttractionState {

  const factory TravelCityAttractionState({
    required List<InfiniteScrollModel<PlaceModel>> attractions,
  }) = _TravelCityAttractionState;

}