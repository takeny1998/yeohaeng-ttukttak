import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_travel_state.freezed.dart';

@freezed
class CreateTravelState with _$CreateTravelState {
  const factory CreateTravelState({
    DateTime? startedOn,
    DateTime? endedOn,
  }) = _CreateTravelState;
}
