import 'package:application_new/domain/geo_json/geo_json_model.dart';
import 'package:application_new/domain/geo_json/geo_json_repository.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/geography_select/geography_select_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geography_select_provider.g.dart';

@riverpod
class GeographySelect extends _$GeographySelect {
  @override
  FutureOr<GeographySelectState> build(int id) async {
    final model = await ref.watch(geoJsonRepositoryProvider).findById(id);

    ref.watch(geographyProvider);

    return GeographySelectState(model: model);
  }

  void active(int id) {
    final prevState = state.value;
    if (prevState == null || prevState.activeId == id) return;

    state = AsyncValue.data(prevState.copyWith(activeId: id));
  }

}
