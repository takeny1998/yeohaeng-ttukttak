import 'package:application/authentication/client/oauth_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_service.dart';
import 'webauth2_auth_service.dart';

part 'auth_service_provider.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  return WebAuth2AuthService(ref.watch(oauthClientProvider));
}
