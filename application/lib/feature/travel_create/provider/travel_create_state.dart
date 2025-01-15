import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_create_state.freezed.dart';

@freezed
class TravelCreateState with _$TravelCreateState {
  const factory TravelCreateState({
    String? name,
    @Default(0) int pageNumber,
    DateTime? startedOn,
    DateTime? endedOn,
    @Default([]) List<TravelCompanionType> companionTypes,
    @Default([]) List<TravelMotivationType> motivationTypes,
    @Default([]) List<CityModel> cities,
    @Default({}) Map<String, String> fieldErrors,
  }) = _TravelCreateState;
}
