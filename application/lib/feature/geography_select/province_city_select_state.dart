import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_city_select_state.freezed.dart';

@freezed
class ProvinceCitySelectState with _$ProvinceCitySelectState {

  const factory ProvinceCitySelectState({
    int? selectedProvinceId,
    int? selectedCityId,
  }) = _ProvinceCitySelectState;

}