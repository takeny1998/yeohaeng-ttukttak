import 'package:application/authentication/domain/auth_credentials.dart';

abstract interface class OAuthService {

  Future<AuthCredentials> register();

  Future<void> revoke();

}