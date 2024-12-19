import 'package:application_new/domain/geo_json/geo_json_model.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geography_select_state.freezed.dart';

@freezed
class GeographySelectState with _$GeographySelectState {

  const factory GeographySelectState({
    required GeoJsonModel model,
    required List<GeographyModel> children,
    @Default([]) List<int> selectIdList,
    int? activeId,
  }) = _ProvinceSelectState;

}