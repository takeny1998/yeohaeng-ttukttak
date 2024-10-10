import 'package:application_new/feature/travel_detail/model/travel_detail_model.dart';
import 'package:application_new/shared/travel/model/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_detail_state.freezed.dart';

@freezed
class TravelDetailState with _$TravelDetailState {
  const TravelDetailState._();

  const factory TravelDetailState({
    required int selectedDay,
    required int selectedPlaceId,
    required TravelDetailModel data,
  }) = _TravelDetailState;

  factory TravelDetailState.empty() => TravelDetailState(
      selectedDay: 0,
      selectedPlaceId: 0,
      data: TravelDetailModel(travel: TravelModel.empty()));
}
