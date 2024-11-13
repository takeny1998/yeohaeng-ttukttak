import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_provider.g.dart';

@Riverpod(keepAlive: true)
Future<TravelModel> travel(TravelRef ref, int id) async {
  final response = await ref
      .watch(httpServiceProvider)
      .request('GET', '/api/v2/travels/$id');

  return TravelModel.fromJson(response['travel']);
}