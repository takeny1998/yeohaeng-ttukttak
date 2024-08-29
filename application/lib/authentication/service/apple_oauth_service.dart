import 'package:application/authentication/client/dto/oauth_register/oauth_register_request.dart';
import 'package:application/authentication/client/oauth_client.dart';
import 'package:application/authentication/domain/auth_credentials.dart';
import 'package:application/authentication/service/oauth_service.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleOAuthService implements OAuthService {
  final OAuthClient oauthClient;

  AppleOAuthService(this.oauthClient);

  Future<AuthorizationCredentialAppleID> _authorize() =>
      SignInWithApple.getAppleIDCredential(
          scopes: [AppleIDAuthorizationScopes.email]);

  @override
  Future<AuthCredentials> register() async {

    final credential = await _authorize();

    final response = await oauthClient.register(
        OAuthRegisterRequest(authorizationCode: credential.authorizationCode));

    return AuthCredentials(
        accessToken: response.accessToken, refreshToken: response.refreshToken);

  }

  @override
  Future<void> revoke() {
    // TODO: implement revoke
    throw UnimplementedError();
  }
}
