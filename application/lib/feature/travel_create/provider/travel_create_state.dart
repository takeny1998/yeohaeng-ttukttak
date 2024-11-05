import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/geography/model/region_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_create_state.freezed.dart';

@freezed
class TravelCreateState with _$TravelCreateState {
  const factory TravelCreateState({
    @Default(0) int pageNumber,
    DateTime? startedOn,
    DateTime? endedOn,
    @Default([]) List<TravelCompanionType> companionTypes,
    @Default([]) List<TravelMotivationType> motivationTypes,
    RegionModel? region,
    @Default([]) List<CityModel> cities,
    @Default(false) bool isSubmitted,
  }) = _TravelCreateState;
}
