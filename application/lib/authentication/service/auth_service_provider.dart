
import 'package:application/authentication/service/oauth/oauth_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_service.dart';
import '../client/token_client_provider.dart';
import '../repository/auth_credentials_repository_provider.dart';

part 'auth_service_provider.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {

  final repository = ref.watch(authCredentialsRepositoryProvider);
  final client = ref.watch(tokenClientProvider);
  final oauthService = ref.watch(oauthServiceProvider);

  return AuthService(repository: repository, client: client, oauthService: oauthService);

}