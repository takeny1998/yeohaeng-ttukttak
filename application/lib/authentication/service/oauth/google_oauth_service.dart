import 'package:application/authentication/client/dto/oauth_register/oauth_register_request.dart';
import 'package:application/authentication/client/oauth_client.dart';
import 'package:application/authentication/domain/auth_credentials.dart';
import 'package:application/authentication/service/oauth/oauth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../client/dto/oauth_revoke/oauth_revoke_request.dart';

class GoogleOAuthService implements OAuthService {
  final OAuthClient _oauthClient;

  GoogleOAuthService({required OAuthClient oauthClient}) : _oauthClient = oauthClient;

  Future<GoogleSignInAccount?> _authorize() => GoogleSignIn(
        serverClientId:
            '951324022006-eigc5h6tj71rm2v31eqr5u0v07cbmpn1.apps.googleusercontent.com',
        scopes: <String>[
          'https://www.googleapis.com/auth/userinfo.profile',
          'https://www.googleapis.com/auth/user.gender.read',
          'https://www.googleapis.com/auth/user.birthday.read'
        ],
      ).signIn();

  @override
  Future<AuthCredentials> register() async {
    final credential = await _authorize();

    final request = OAuthRegisterRequest(authorizationCode: credential!.serverAuthCode!);
    final response = await _oauthClient.registerGoogle(request);

    return AuthCredentials.fromResponse(response);
  }

  @override
  Future<void> revoke() async {
    final credential = await _authorize();

    throw UnimplementedError();
  }
}
