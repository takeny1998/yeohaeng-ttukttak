import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_form_model.freezed.dart';

@freezed
class TravelFormModel with _$TravelFormModel {

  const TravelFormModel._();

  const factory TravelFormModel({
    required DateTime? startedOn,
    required DateTime? endedOn,
    required Iterable<TravelMotivationType> motivationTypes,
    required Iterable<TravelCompanionType> companionTypes,
    required Iterable<CityModel> cities,
  }) = _TravelFormModel;

  factory TravelFormModel.fromState(TravelCreateState state) => TravelFormModel(
    startedOn: state.startedOn,
    endedOn: state.endedOn,
    motivationTypes: state.motivationTypes,
    companionTypes: state.companionTypes,
    cities: state.cities
  );

  Map<String, dynamic> toMap() => {
        'date': {
          'startedOn': startedOn?.toIso8601String(),
          'endedOn': endedOn?.toIso8601String(),
        },
        'companionTypes': companionTypes.map((e) => e.name).toList(),
        'motivationTypes': motivationTypes.map((e) => e.name).toList(),
        'cities': cities,
      };
}
