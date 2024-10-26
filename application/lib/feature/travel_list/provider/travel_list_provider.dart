import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/feature/travel_list/model/travel_list_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_list_provider.g.dart';

@riverpod
class TravelList extends _$TravelList {
  @override
  TravelListModel build() {
    _init();
    return const TravelListModel();
  }

  void _init() async {
    final httpService = ref.read(httpServiceProvider);
    final authService = ref.read(authServiceProvider);

    final authModel = await authService.find();

    final response = await httpService.request(
        'GET', '/api/v2/travels/members/me',
        authorization: authModel.accessToken);

    state = TravelListModel.fromJson(response);


  }
}
