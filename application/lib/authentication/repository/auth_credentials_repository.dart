
import 'package:application/authentication/domain/auth_credentials.dart';

abstract interface class AuthCredentialsRepository {

  Future<AuthCredentials?> find();

  Future<void> save(AuthCredentials authCredentials);

  Future<void> delete(AuthCredentials authCredentials);

}