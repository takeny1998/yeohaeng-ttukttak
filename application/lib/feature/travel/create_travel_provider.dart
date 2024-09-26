import 'package:application_new/feature/travel/create_travel_state.dart';
import 'package:application_new/feature/travel/model/travel_comanion.dart';
import 'package:application_new/feature/travel/model/travel_motivation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_travel_provider.g.dart';

@riverpod
class CreateTravel extends _$CreateTravel {

  @override
  CreateTravelState build() {
    return const CreateTravelState();
  }

  void selectDate(DateTime? startedOn, DateTime? endedOn) {
    if (startedOn == null || endedOn == null) {
      return;
    }

    state = state.copyWith(
      startedOn: startedOn,
      endedOn: endedOn,
    );
  }

  void selectCompanion(TravelCompanion companion) {
    state = state.copyWith(companion: companion);
  }

  void selectMotivation(TravelMotivation motivation) {
    final curtMotivations = state.motivations;

    final isExist = curtMotivations.contains(motivation);

    if (isExist) {
      state = state.copyWith(motivations: [
        for (final e in curtMotivations)
          if (e != motivation) e
      ]);
    } else {
      if (curtMotivations.length >= 3) return;
      state = state.copyWith(motivations: [...curtMotivations, motivation]);
    }
  }
}
