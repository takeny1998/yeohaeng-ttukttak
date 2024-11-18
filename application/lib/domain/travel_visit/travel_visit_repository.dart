import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/authentication/service/auth_service.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_visit_repository.g.dart';

class TravelVisitRepository {
  final AuthService authService;
  final HttpService httpService;

  TravelVisitRepository(this.authService, this.httpService);

  Future<TravelVisitModel> create(int travelId, TravelVisitForm form) async {
    final auth = await authService.find();

    final response = await httpService.request(
      'POST',
      '/api/v2/travels/$travelId/visits',
      authorization: auth.accessToken,
      data: form.toJson(),
    );

    return TravelVisitModel.fromJson(response['visit']);
  }
}

@riverpod
TravelVisitRepository travelVisitRepository(TravelVisitRepositoryRef ref) {
  return TravelVisitRepository(
      ref.watch(authServiceProvider), ref.watch(httpServiceProvider));
}
