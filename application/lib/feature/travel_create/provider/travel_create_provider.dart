import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/geography/model/region_model.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
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

  void selectCompanion(TravelCompanionType companion) {
    state = state.copyWith(companion: companion);
  }

  void selectMotivation(TravelMotivation motivation) {
    final curtMotivations = state.motivations;

    final isExist = curtMotivations.contains(motivation);

    if (isExist) {
      state = state.copyWith(motivations: [
        for (final e in curtMotivations)
          if (e != motivation) e
      ]);
    } else {
      if (curtMotivations.length >= 3) return;
      state = state.copyWith(motivations: [...curtMotivations, motivation]);
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
    final loadingNotifier = ref.read(asyncLoadingProvider.notifier);

    await loadingNotifier.guard(() async {
      final httpService = ref.read(httpServiceProvider);
      final authService = ref.read(authServiceProvider);

      final authModel = await authService.find();

      await httpService.request('POST', '/api/v2/travels',
          authorization: authModel.accessToken,
          data: {
            'date': {
              'startedOn': state.startedOn?.toIso8601String(),
              'endedOn': state.endedOn?.toIso8601String(),
            },
            'companionType': state.companion?.name,
            'motivations':
                state.motivations.map((motivation) => motivation.name).toList(),
            'cities': state.cities,
          });
    });

    state = state.copyWith(isSubmitted: true);
  }
}
