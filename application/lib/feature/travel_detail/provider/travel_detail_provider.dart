import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/travel_detail/model/travel_detail_model.dart';
import 'package:application_new/feature/travel_detail/model/travel_visit_model.dart';
import 'package:application_new/feature/travel_detail/provider/travel_detail_state.dart';
import 'package:application_new/shared/model/travel_model.dart';
import 'package:application_new/shared/provider/travel_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_detail_provider.g.dart';

@riverpod
class TravelDetail extends _$TravelDetail {
  @override
  TravelDetailState build(int travelId) {
    final detail = ref.watch(travelProvider(travelId));

    final selectedDate = detail.travel.startedOn;

    return TravelDetailState(
        selectedDate: selectedDate,
        detail: detail,
        selectedVisits: _filterVisits(detail.visits, selectedDate));
  }

  void selectDate(DateTime date) {
    if (state.selectedDate == date) return;
    state = state.copyWith(
        selectedDate: date,
        selectedVisits: _filterVisits(state.detail.visits, date));
  }

  void selectPlace(int id) {
    if (state.selectedPlaceId == id) return;
    state = state.copyWith(selectedPlaceId: id);
  }

  void setIsMapMoved(bool isMapMoved) {
    if (state.isMapMoved == isMapMoved) return;
    state = state.copyWith(isMapMoved: isMapMoved);
  }

  List<TravelVisitModel> _filterVisits(
      List<TravelVisitModel> visits, DateTime day) {
    return visits.where((visit) => visit.visitedOn == day).toList();
  }
}
