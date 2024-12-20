import 'package:application_new/domain/geo_json/geo_json_repository.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/geography_select/geography_select_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geography_select_provider.g.dart';

@riverpod
class GeographySelect extends _$GeographySelect {
  @override
  FutureOr<GeographySelectState> build(int id) async {
    final model = await ref.watch(geoJsonRepositoryProvider).findById(id);
    final geographies = await ref.watch(geographiesProvider.future);

    final children = geographies
        .where((e) => e.map(
            country: (_) => false,
            province: (province) => province.parentId == id,
            city: (city) => city.parentId == id))
        .toList();

    return GeographySelectState(model: model, children: children);
  }

  void active(GeographyModel child) {
    final prevState = state.value;
    if (prevState == null || prevState.activeChild == child) return;

    state = AsyncValue.data(prevState.copyWith(activeChild: child));
  }
}
