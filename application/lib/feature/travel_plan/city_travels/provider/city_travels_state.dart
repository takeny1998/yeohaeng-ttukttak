import 'package:application_new/feature/travel_plan/city_travels/model/paged_travels_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_travels_state.freezed.dart';

@freezed
class CityTravelsState with _$CityTravelsState {
  const factory CityTravelsState({
    required PagedTravelsModel pagedTravels,
  }) = _CityTravelsState;
}
