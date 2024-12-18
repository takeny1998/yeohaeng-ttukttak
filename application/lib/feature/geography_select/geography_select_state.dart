import 'package:application_new/domain/geo_json/geo_json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geography_select_state.freezed.dart';

@freezed
class GeographySelectState with _$GeographySelectState {

  const factory GeographySelectState({
    int? selectedId,
  }) = _ProvinceSelectState;

}