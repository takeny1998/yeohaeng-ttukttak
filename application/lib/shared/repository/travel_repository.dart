import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/authentication/service/auth_service.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/shared/model/travel/travel_form_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_repository.g.dart';

final class TravelRepository {
  final AuthService authService;
  final HttpService httpService;

  List<TravelModel> travels = [];

  TravelRepository({required this.authService, required this.httpService});

  Future<void> submit(TravelFormModel form) async {
    final authModel = await authService.find();

    final response = await httpService.request('POST', '/api/v2/travels',
        authorization: authModel.accessToken, data: form.toMap());

    final travel = TravelModel.fromJson(response['travel']);
    travels.add(travel);
  }

  Future<TravelModel> find(int id) async {
    final foundTravel = travels.firstWhereOrNull((travel) => travel.id == id);
    if (foundTravel != null) return foundTravel;

    final response = await httpService.request('GET', '/api/v2/travels/$id');

    final travel = TravelModel.fromJson(response['travel']);

    travels.add(travel);
    return travel;
  }
}

@riverpod
TravelRepository travelRepository(TravelRepositoryRef ref) {
  return TravelRepository(
      authService: ref.watch(authServiceProvider),
      httpService: ref.watch(httpServiceProvider));
}
