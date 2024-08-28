import 'package:application/authentication/domain/auth_credentials.dart';

abstract interface class AuthService {

  Future<AuthCredentials> register(String uri);

  Future<void> revoke();

}