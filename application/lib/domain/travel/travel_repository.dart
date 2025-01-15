import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/shared/dto/types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_repository.g.dart';

final class TravelRepository {
  final HttpService httpService;

  TravelRepository(this.httpService);

  Future<TravelModel> create({
    required String name,
    required DateTime startedOn,
    required DateTime endedOn,
    required List<TravelCompanionType> companionTypes,
    required List<TravelMotivationType> motivationTypes,
    required List<CityModel> cities,
  }) async {
    final response = await httpService.post('/travels',
        options: ServerRequestOptions(data: {
          'startedOn': startedOn.toIso8601String(),
          'endedOn': endedOn.toIso8601String(),
          'name': name,
          'companionTypes': companionTypes.map((e) => e.name).toList(),
          'motivationTypes': motivationTypes.map((e) => e.name).toList(),
          'cityIds': cities.map((city) => city.id).toList(),
        }));

    return TravelModel.fromJson(response['travel']);
  }

  Future<TravelModel> update(int travelId, {
    String? name,
    DateTime? startedOn,
    DateTime? endedOn,
    List<TravelCompanionType>? companionTypes,
    List<TravelMotivationType>? motivationTypes,
    List<CityModel>? cities,
  }) async {
    final Json requestData = {};

    void addIfNotNull(String key, dynamic value) {
      if (value != null) {
        requestData[key] = value;
      }
    }

    addIfNotNull('name', name);
    addIfNotNull('startedOn', startedOn);
    addIfNotNull('endedOn', endedOn);
    addIfNotNull('companionTypes', companionTypes?.map((e) => e.name).toList());
    addIfNotNull('motivationTypes', motivationTypes?.map((e) => e.name).toList());

    final response = await httpService.patch('/travels/$travelId',
        options: ServerRequestOptions(data: requestData));

    return TravelModel.fromJson(response['travel']);
  }


}

@riverpod
TravelRepository travelRepository(TravelRepositoryRef ref) {
  return TravelRepository(ref.watch(httpServiceProvider));
}