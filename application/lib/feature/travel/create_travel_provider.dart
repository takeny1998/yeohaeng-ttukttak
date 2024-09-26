import 'package:application_new/feature/travel/create_travel_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_travel_provider.g.dart';


@riverpod
class CreateTravel extends _$CreateTravel {

  @override
  CreateTravelState build() {
    return const CreateTravelState();
  }

  void inputDate(DateTime? startedOn, DateTime? endedOn) {

    if (startedOn == null || endedOn == null) {
      return;
    }


    state = state.copyWith(
      startedOn: startedOn,
      endedOn: endedOn,
    );
  }


}
