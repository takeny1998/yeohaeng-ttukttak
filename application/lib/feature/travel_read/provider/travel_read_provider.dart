import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/travel_read/model/travel_visit_model.dart';
import 'package:application_new/feature/travel_read/provider/travel_read_state.dart';
import 'package:application_new/shared/model/travel/travel_detail_model.dart';
import 'package:application_new/shared/provider/travel_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_read_provider.g.dart';

@riverpod
class TravelRead extends _$TravelRead {
  @override
  TravelReadState? build(int travelId) {
    final travel = ref.watch(travelProvider(travelId));

    if (travel != null) {
      _init(travel.id, travel.startedOn);
    }

    return null;
  }

  void _init(int travelId, DateTime selectedDate) async {
    final httpService = ref.watch(httpServiceProvider);

    final response =
        await httpService.request('GET', '/api/v2/travels/$travelId/detail');

    final detail = TravelDetailModel.fromJson(response);

    state = TravelReadState(
        selectedDate: selectedDate,
        visits: detail.visits,
        places: detail.places,
        selectedVisits: _filterVisits(detail.visits, selectedDate));
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
