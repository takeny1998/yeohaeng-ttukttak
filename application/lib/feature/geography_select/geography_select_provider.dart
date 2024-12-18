
import 'package:application_new/domain/geography/geo_json_repository.dart';
import 'package:application_new/feature/geography_select/geography_select_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geography_select_provider.g.dart';

@riverpod
class GeographySelect extends _$GeographySelect {

  @override
  FutureOr<GeographySelectState> build() async {
    final geoJsons = await ref.read(geoJsonRepositoryProvider).load();
    return GeographySelectState(geoJsons: geoJsons);
  }


  void selectCity(int cityId) {
    final prevState = state.value;
    if (prevState == null || prevState.selectedCityId == cityId) return;

    state = AsyncValue.data(prevState.copyWith(
      selectedCityId: cityId
    ));
  }

  void selectState(int stateId) {
    final prevState = state.value;
    if (prevState == null || prevState.selectedStateId == stateId) return;

    state = AsyncValue.data(prevState.copyWith(
       selectedStateId: stateId
    ));
  }

} 