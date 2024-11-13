import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/domain/travel/travel_visit_model.dart';
import 'package:application_new/feature/travel_read/provider/travel_read_state.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_read_provider.g.dart';

@riverpod
class TravelRead extends _$TravelRead {
  @override
  TravelReadState? build(int travelId) {
    final travel = ref.watch(travelProvider(travelId)).valueOrNull;

    if (travel != null) {
      _init(travel, travel.startedOn);
    }

    return null;
  }

  void _init(TravelModel travel, DateTime selectedDate) async {
    final httpService = ref.watch(httpServiceProvider);

    final visitsRes =
        await httpService.request('GET', '/api/v2/travels/$travelId/visits');

    final visits = List.of(visitsRes['visits'])
        .map((json) => TravelVisitModel.fromJson(json))
        .toList();

    state = TravelReadState(
      travel: travel,
      selectedDate: selectedDate,
      visits: visits,
      selectedVisits: _filterVisits(visits, selectedDate),
    );
  }

  void selectDate(DateTime date) {
    if (state?.selectedDate == date) return;
    state = state?.copyWith(
        selectedDate: date, selectedVisits: _filterVisits(state!.visits, date));
  }

  void selectPlace(int id) {
    if (state?.selectedPlaceId == id) return;
    state = state?.copyWith(selectedPlaceId: id);
  }

  void setIsMapMoved(bool isMapMoved) {
    if (state?.isMapMoved == isMapMoved) return;
    state = state?.copyWith(isMapMoved: isMapMoved);
  }

  List<TravelVisitModel> _filterVisits(
      List<TravelVisitModel> visits, DateTime day) {
    return visits.where((visit) => visit.visitedOn == day).toList();
  }
}
