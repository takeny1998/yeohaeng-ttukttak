import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/geography_select/geography_select_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'province_city_select_provider.g.dart';

@riverpod
class ProvinceCitySelect extends _$ProvinceCitySelect {
  @override
  ProvinceCitySelectState build() {

    ref.onDispose(() {
      ref.invalidate(geographySelectProvider);
    });

    return const ProvinceCitySelectState();
  }

  void activeProvince(ProvinceModel? province) {
    if (state.activeProvince == province) return;
    state = state.copyWith(activeProvince: province);
  }

  void selectProvince(ProvinceModel? province) {
    if (state.selectProvince == province) return;
    state = state.copyWith(selectProvince: province);
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
