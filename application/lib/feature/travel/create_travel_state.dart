import 'package:application_new/feature/travel/model/travel_comanion.dart';
import 'package:application_new/feature/travel/model/travel_motivation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_travel_state.freezed.dart';

@freezed
class CreateTravelState with _$CreateTravelState {
  const factory CreateTravelState({
    DateTime? startedOn,
    DateTime? endedOn,
    TravelCompanion? companion,
    @Default([]) List<TravelMotivation> motivations,
  }) = _CreateTravelState;
}
