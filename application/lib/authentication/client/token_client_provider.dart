
import 'package:application/common/database/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'token_client.dart';

part 'token_client_provider.g.dart';


@riverpod
TokenClient tokenClient(TokenClientRef ref) {

  final dio = ref.watch(dioProvider);

  return TokenClient(dio, baseUrl: 'https://bug-steady-reliably.ngrok-free.app');

}
