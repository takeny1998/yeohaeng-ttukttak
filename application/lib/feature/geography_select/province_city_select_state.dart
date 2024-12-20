import 'package:application_new/domain/geography/geography_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_city_select_state.freezed.dart';

@freezed
class ProvinceCitySelectState with _$ProvinceCitySelectState {

  const factory ProvinceCitySelectState({
    int? selectedProvinceId,
    @Default([]) List<CityModel> selectedCities,
  }) = _ProvinceCitySelectState;

}