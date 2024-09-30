import 'package:application_new/feature/region/model/city_model.dart';
import 'package:application_new/feature/region/model/region_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geography_state.freezed.dart';

@freezed
class GeographyState with _$GeographyState {
  const factory GeographyState({
    @Default([]) List<RegionModel> regions,
    @Default([]) List<CityModel> cities,
  }) = _GeographyState;
}
