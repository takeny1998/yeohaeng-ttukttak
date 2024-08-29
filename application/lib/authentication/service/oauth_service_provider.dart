import 'package:application/authentication/client/oauth_client_provider.dart';
import 'package:application/authentication/service/apple_oauth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'oauth_service.dart';

part 'oauth_service_provider.g.dart';

@riverpod
OAuthService oauthService(OauthServiceRef ref) {
  return AppleOAuthService(ref.watch(oauthClientProvider));
}
