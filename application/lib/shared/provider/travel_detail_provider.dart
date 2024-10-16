import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/shared/model/travel/travel_detail_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_detail_provider.g.dart';

@riverpod
class TravelDetail extends _$TravelDetail {

  @override
  TravelDetailModel build(int id) {
    _init(id);
    return TravelDetailModel.empty();
  }

  void _init (int id) async {

    final httpService = ref.watch(httpServiceProvider);

    final response =
    await httpService.request('GET', '/api/v2/travels/$id/detail');

    state = TravelDetailModel.fromJson(response);
  }

}

