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
    final geographies = await ref.watch(geographiesProvider.future);

    final children = geographies
        .where((e) => e.map(
            country: (_) => false,
            province: (province) => province.parentId == id,
            city: (city) => city.parentId == id))
        .toList();

    return GeographySelectState(model: model, children: children);
  }

  void active(int id) {
    final prevState = state.value;
    if (prevState == null || prevState.activeId == id) return;

    state = AsyncValue.data(prevState.copyWith(activeId: id));
  }

  void select(int id) {
    final prevState = state.value;
    if (prevState == null) return;

    final selectIdList = List.of(prevState.selectIdList);

    if (selectIdList.contains(id)) {
      selectIdList.remove(id);
    } else {
      selectIdList.add(id);
    }

    state = AsyncValue.data(prevState.copyWith(selectIdList: selectIdList));
  }
}
