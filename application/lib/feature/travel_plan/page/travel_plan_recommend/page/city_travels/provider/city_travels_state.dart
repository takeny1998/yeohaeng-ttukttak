import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_travels/model/paged_travels_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_travels_state.freezed.dart';

@freezed
class CityTravelsState with _$CityTravelsState {
  const CityTravelsState._();

  const factory CityTravelsState({
    required CityModel city,
    @Default([]) List<TravelModel> travels,
    @Default(false) hasNextPage,
  }) = _CityTravelsState;

  CityTravelsState mergeWith(PagedTravelsModel pagedTravels) {
    return CityTravelsState(
        city: city,
        travels: [...travels, ...pagedTravels.travels],
        hasNextPage: hasNextPage || pagedTravels.hasNextPage);
  }
}
