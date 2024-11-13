import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'place_provider.g.dart';

@Riverpod(keepAlive: true)
Future<PlaceModel> place(PlaceRef ref, int id) async {
  final response =
      await ref.watch(httpServiceProvider).request('GET', '/api/v2/places/$id');

  return PlaceModel.fromJson(response['place']);
}