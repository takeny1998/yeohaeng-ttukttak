import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/feature/geography_select/province_city_select_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'province_city_select_provider.g.dart';

@riverpod
class ProvinceCitySelect extends _$ProvinceCitySelect {
  @override
  ProvinceCitySelectState build() {
    return const ProvinceCitySelectState();
  }

  void selectProvince(int id) {
    if (state.selectedProvinceId == id) return;
    state = state.copyWith(selectedProvinceId: id);
  }

  void selectCity(CityModel city) {
    final selectCities = List.of(state.selectedCities);

    if (selectCities.contains(city)) {
      selectCities.remove(city);
    } else {
      selectCities.add(city);
    }

    state = state.copyWith(selectedCities: selectCities);
  }

}
