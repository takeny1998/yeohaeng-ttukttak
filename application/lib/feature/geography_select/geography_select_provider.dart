import 'package:application_new/domain/geo_json/geo_json_model.dart';
import 'package:application_new/feature/geography_select/geography_select_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geography_select_provider.g.dart';

@riverpod
class GeographySelect extends _$GeographySelect {

  @override
  GeographySelectState build(GeoJsonModel geoJson){
    return const GeographySelectState();
  }

  void selectProvince(int provinceId) {
    if (state.selectedId == provinceId) return;
    state = state.copyWith(selectedId: provinceId);
  }
}
