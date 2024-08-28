
import 'package:application/authentication/client/oauth_client.dart';
import 'package:application/common/database/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'oauth_client_provider.g.dart';

@riverpod
OAuthClient oauthClient(OauthClientRef ref) {
  final dio = ref.watch(dioProvider);
  return OAuthClient(dio, baseUrl: 'https://bug-steady-reliably.ngrok-free.app');
}