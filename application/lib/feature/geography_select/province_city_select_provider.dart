import 'package:application_new/feature/geography_select/province_city_select_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'province_city_select_provider.g.dart';

@riverpod
class ProvinceCitySelect extends _$ProvinceCitySelect {
  @override
  ProvinceCitySelectState build() {
    return const ProvinceCitySelectState();
  }

  void selectProvince(int? provinceId) {
    if (state.selectedProvinceId == provinceId) return;
    state = state.copyWith(selectedProvinceId: provinceId);
  }

  void selectCity(int? cityId) {
    if (state.selectedCityId == cityId) return;
    state = state.copyWith(selectedCityId: cityId);
  }
}
