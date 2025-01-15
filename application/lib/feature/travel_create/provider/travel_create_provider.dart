import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_create_provider.g.dart';

@riverpod
class TravelCreate extends _$TravelCreate {
  @override
  TravelCreateState build() {
    return const TravelCreateState();
  }

  void enterName(String? name) {
    if (state.name == name) return;
    state = state.copyWith(name: name);
  }

  void selectDate(DateTime? startedOn, DateTime? endedOn) {
    if (startedOn == null || endedOn == null) {
      return;
    }

    state = state.copyWith(
      startedOn: startedOn,
      endedOn: endedOn,
    );
  }

  void selectCompanionType(TravelCompanionType companionType) {
    final companionTypes = state.companionTypes;

    if (companionTypes.contains(companionType)) {
      state = state.copyWith(companionTypes: [
        for (final e in companionTypes)
          if (e != companionType) e
      ]);
    } else {
      if (companionTypes.length >= 3) return;
      state =
          state.copyWith(companionTypes: [...companionTypes, companionType]);
    }
  }

  void selectMotivationType(TravelMotivationType motivationType) {
    final motivationTypes = state.motivationTypes;

    if (motivationTypes.contains(motivationType)) {
      state = state.copyWith(motivationTypes: [
        for (final e in motivationTypes)
          if (e != motivationType) e
      ]);
    } else {
      if (motivationTypes.length >= 5) return;
      state =
          state.copyWith(motivationTypes: [...motivationTypes, motivationType]);
    }
  }

  void selectCities(List<CityModel> cities) {
    if (cities.length > 10 || cities.isEmpty) return;

    state = state.copyWith(cities: cities);
  }

  void setFieldErrors(Map<String, String> fieldErrors) {
    if (state.fieldErrors == fieldErrors) return;
    state = state.copyWith(fieldErrors: fieldErrors);
  }
}
