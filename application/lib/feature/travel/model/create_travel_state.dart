import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/geography/model/region_model.dart';
import 'package:application_new/shared/model/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_travel_state.freezed.dart';

@freezed
class CreateTravelState with _$CreateTravelState {
  const factory CreateTravelState({
    @Default(0) int pageNumber,
    DateTime? startedOn,
    DateTime? endedOn,
    TravelCompanionType? companion,
    String? citySearchText,
    @Default([]) List<TravelMotivation> motivations,
    @Default([]) List<RegionModel> regions,
    @Default([]) List<CityModel> cities,
    @Default(false) bool isSubmitted,
  }) = _CreateTravelState;
}
