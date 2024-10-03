import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/travel_detail/model/travel_detail_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_detail_provider.g.dart';

@riverpod
class TravelDetail extends _$TravelDetail {
  @override
  TravelDetailModel build(int travelId) {
    ref
        .watch(httpServiceProvider)
        .request('GET', '/api/v2/travels/$travelId/detail')
        .then((response) {
          state = TravelDetailModel.fromJson(response);
    });

    return const TravelDetailModel();
  }
}
