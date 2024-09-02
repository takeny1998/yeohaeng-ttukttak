
import 'package:application/authentication/client/oauth_client_provider.dart';
import 'package:application/authentication/repository/auth_credentials_repository_provider.dart';
import 'package:application/authentication/service/auth_service.dart';
import 'package:application/authentication/service/oauth/google_oauth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_auth_service_provider.g.dart';

@riverpod
AuthService googleAuthService(GoogleAuthServiceRef ref) {
  final repository = ref.watch(authCredentialsRepositoryProvider);
  final oauthService = GoogleOAuthService(oauthClient: ref.watch(oauthClientProvider));

  return AuthService(repository: repository, oauthService: oauthService);

}