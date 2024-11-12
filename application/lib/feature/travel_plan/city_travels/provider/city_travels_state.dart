import 'package:application_new/feature/travel_plan/city_travels/model/paged_travels_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_travels_state.freezed.dart';

@freezed
class CityTravelsState with _$CityTravelsState {
  const CityTravelsState._();

  const factory CityTravelsState({
    @Default([]) List<TravelModel> travels,
    @Default(false) hasNextPage,
  }) = _CityTravelsState;

  CityTravelsState mergeWith(PagedTravelsModel pagedTravels) {

    return CityTravelsState(
        travels: [...travels, ...pagedTravels.travels],
        hasNextPage: hasNextPage || pagedTravels.hasNextPage);
  }
}
