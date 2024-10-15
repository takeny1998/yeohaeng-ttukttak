import 'package:application_new/feature/travel_detail/model/travel_detail_model.dart';
import 'package:application_new/feature/travel_detail/model/travel_visit_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_detail_state.freezed.dart';

@freezed
class TravelDetailState with _$TravelDetailState {
  const TravelDetailState._();

  const factory TravelDetailState({
    required DateTime selectedDate,
    @Default(0) int selectedPlaceId,
    @Default(false) bool isMapMoved,
    required TravelDetailModel detail,
    @Default([]) List<TravelVisitModel> selectedVisits,
  }) = _TravelDetailState;

}
