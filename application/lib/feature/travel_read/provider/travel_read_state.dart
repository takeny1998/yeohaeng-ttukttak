import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/domain/travel/travel_visit_model.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_read_state.freezed.dart';

@freezed
class TravelReadState with _$TravelReadState {

  const factory TravelReadState({
    required DateTime selectedDate,
    required TravelModel travel,
    @Default([]) List<TravelVisitModel> visits,
    @Default(0) int selectedPlaceId,
    @Default(false) bool isMapMoved,
    @Default([]) List<TravelVisitModel> selectedVisits,
  }) = _TravelReadState;

}
