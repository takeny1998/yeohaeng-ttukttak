import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/geography/model/region_model.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_create_provider.g.dart';

@riverpod
class TravelCreate extends _$TravelCreate {
  @override
  TravelCreateState build() {
    return const TravelCreateState();
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

  void selectCity(CityModel city) {
    final cities = state.cities;
    final isExist = cities.contains(city);

    if (isExist) {
      state = state.copyWith(cities: [
        for (final e in cities)
          if (e != city) e
      ]);
    } else {
      state = state.copyWith(cities: [...cities, city]);
    }
  }

  void selectRegion(RegionModel? region) {
    if (state.region == region) return;

    state = state.copyWith(
      region: region,
    );
  }

  void prevPage() {
    if (state.pageNumber == 0) return;
    state = state.copyWith(pageNumber: state.pageNumber - 1);
  }

  void nextPage() {
    if (state.pageNumber == 2) return;
    state = state.copyWith(pageNumber: state.pageNumber + 1);
  }

  void submit() async {
    final formModel = TravelFormModel.fromState(state);

    final travel =
        await ref.read(asyncLoadingProvider.notifier).guard(() async {

      final authModel = await ref.read(authServiceProvider).find();
      final response = await ref.read(httpServiceProvider).request(
          'POST', '/api/v2/travels',
          authorization: authModel.accessToken, data: formModel.toMap());

      return TravelModel.fromJson(response);
    });

    state = state.copyWith(isSubmitted: true);
  }
}
