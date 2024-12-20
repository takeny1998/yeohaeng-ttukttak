import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_state.dart';
import 'package:application_new/shared/dto/reference.dart';
import 'package:application_new/shared/dto/reference_iterable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'province_city_select_provider.g.dart';

@riverpod
class ProvinceCitySelect extends _$ProvinceCitySelect {
  @override
  ProvinceCitySelectState build() {
    return const ProvinceCitySelectState();
  }

  void activeProvince(ProvinceModel? province) {
    if (state.activeProvince == province) return;
    state = state.copyWith(activeProvince: province);
  }

  void selectCity(CityModel city) async {
    final selectedCities = state.selectedCities;

    if (selectedCities.contains(city)) {
      state = state.copyWith(selectedCities: selectedCities.remove(city));
      return;
    }

    final province = await ref.watch(provinceProvider(city.parentId).future);
    state = state.copyWith(selectedCities: selectedCities.add(city, province));
  }
}
