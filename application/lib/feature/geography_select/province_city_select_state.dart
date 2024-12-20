import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/shared/dto/reference.dart';
import 'package:application_new/shared/dto/reference_iterable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_city_select_state.freezed.dart';

@freezed
class ProvinceCitySelectState with _$ProvinceCitySelectState {
  const factory ProvinceCitySelectState({
    ProvinceModel? activeProvince,
    CityModel? activeCity,
    ProvinceModel? selectProvince,
    @Default(ReferenceIterable())
    ReferenceIterable<CityModel, ProvinceModel> selectedCities,
  }) = _ProvinceCitySelectState;
}
