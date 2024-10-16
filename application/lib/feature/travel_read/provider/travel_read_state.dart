import 'package:application_new/shared/model/travel/travel_detail_model.dart';
import 'package:application_new/feature/travel_read/model/travel_visit_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_read_state.freezed.dart';

@freezed
class TravelReadState with _$TravelReadState {

  const factory TravelReadState({
    required DateTime selectedDate,
    @Default(0) int selectedPlaceId,
    @Default(false) bool isMapMoved,
    required TravelDetailModel detail,
    @Default([]) List<TravelVisitModel> selectedVisits,
  }) = _TravelReadState;

}
