import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/travel_detail/model/travel_detail_model.dart';
import 'package:application_new/feature/travel_detail/model/travel_visit_model.dart';
import 'package:application_new/feature/travel_detail/provider/travel_detail_state.dart';
import 'package:application_new/shared/travel/model/travel_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_detail_provider.g.dart';

@riverpod
class TravelDetail extends _$TravelDetail {
  @override
  TravelDetailState build(int travelId) {
    ref
        .watch(httpServiceProvider)
        .request('GET', '/api/v2/travels/$travelId/detail')
        .then((response) {
      state = state.copyWith(data: TravelDetailModel.fromJson(response));
    });

    return TravelDetailState.empty();
  }

  void selectDay(int day) {
    if (state.selectedDay == day) return;
    state = state.copyWith(selectedDay: day);
  }

  Iterable<TravelVisitModel> filterVisits() {
    final selectedDay =
        state.data.travel.startedOn.add(Duration(days: state.selectedDay));

    return state.data.visits
        .where((visit) => visit.visitedOn == selectedDay);
  }
}
