import 'package:application/authentication/client/dto/oauth_register/oauth_register_request.dart';
import 'package:application/authentication/client/oauth_client.dart';
import 'package:application/authentication/domain/auth_credentials.dart';
import 'package:application/authentication/service/oauth/oauth_service.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../client/dto/oauth_revoke/oauth_revoke_request.dart';

class AppleOAuthService implements OAuthService {
  final OAuthClient oauthClient;

  AppleOAuthService(this.oauthClient);

  Future<AuthorizationCredentialAppleID> _authorize() =>
      SignInWithApple.getAppleIDCredential(
          scopes: [AppleIDAuthorizationScopes.email]);

  @override
  Future<AuthCredentials> register() async {
    final credential = await _authorize();

    final response = await oauthClient.registerApple(
        OAuthRegisterRequest(authorizationCode: credential.authorizationCode));

    return AuthCredentials.fromResponse(response);
  }

  @override
  Future<void> revoke() async {
    final credential = await _authorize();

    await oauthClient.revokeApple(
        OAuthRevokeRequest(authorizationCode: credential.authorizationCode));
  }
}
