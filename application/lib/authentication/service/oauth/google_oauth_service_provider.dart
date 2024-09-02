
import 'package:application/authentication/client/oauth_client_provider.dart';
import 'package:application/authentication/service/oauth/google_oauth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_oauth_service_provider.g.dart';

@riverpod
GoogleOAuthService googleOAuthService(GoogleOAuthServiceRef ref) {
  return GoogleOAuthService(oauthClient: ref.watch(oauthClientProvider));
}