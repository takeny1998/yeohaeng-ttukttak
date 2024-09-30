import 'package:freezed_annotation/freezed_annotation.dart';

import 'city_model.dart';
import 'region_model.dart';

part 'geography_state.freezed.dart';

@freezed
class GeographyState with _$GeographyState {
  const factory GeographyState({
    @Default([]) List<RegionModel> regions,
    @Default([]) List<CityModel> cities,
  }) = _GeographyState;
}
