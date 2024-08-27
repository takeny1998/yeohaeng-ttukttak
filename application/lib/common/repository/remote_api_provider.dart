
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dio_provider.dart';
import 'remote_api.dart';

part 'remote_api_provider.g.dart';

@riverpod
RemoteApi remoteApi(RemoteApiRef ref) {

  final dio = ref.watch(dioProvider);

  return RemoteApi(dio);

}