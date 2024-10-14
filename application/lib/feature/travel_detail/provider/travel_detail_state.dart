import 'package:application_new/feature/travel_detail/model/travel_detail_model.dart';
import 'package:application_new/feature/travel_detail/model/travel_visit_model.dart';
import 'package:application_new/shared/model/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_detail_state.freezed.dart';

@freezed
class TravelDetailState with _$TravelDetailState {
  const TravelDetailState._();

  const factory TravelDetailState({
    required DateTime selectedDate,
    required int selectedPlaceId,
    required bool isMapMoved,
    required TravelDetailModel data,
    required List<TravelVisitModel> selectedVisits,
  }) = _TravelDetailState;

  factory TravelDetailState.empty() => TravelDetailState(
      selectedDate: DateTime.now(),
      selectedPlaceId: 0,
      isMapMoved: false,
      selectedVisits: [],
      data: TravelDetailModel(travel: TravelModel.empty()));
}
