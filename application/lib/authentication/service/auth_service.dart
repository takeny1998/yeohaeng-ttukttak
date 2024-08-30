import 'package:application/authentication/client/dto/token_renew/token_renew_request.dart';
import 'package:dio/dio.dart';

import '../domain/auth_credentials.dart';
import '../repository/auth_credentials_repository.dart';
import '../client/token_client.dart';
import 'oauth/oauth_service.dart';

class AuthService {

  final AuthCredentialsRepository _repository;
  final TokenClient _client;
  final OAuthService _oauthService;

  AuthService({required AuthCredentialsRepository repository, required TokenClient client, required OAuthService oauthService}) : _repository = repository, _client = client, _oauthService = oauthService;


  Future<AuthCredentials> login() async {

    final credentials = await _oauthService.register();
    await _repository.save(credentials);

    return credentials;
  }

  Future<void> logout() async {

    final credentials = await _repository.find();
    if (credentials == null) return;

    await _repository.delete();

  }

  Future<void> deleteAccount() async {

    await _oauthService.revoke();
    await _repository.delete();

  }

  Future<void> renew() async {

    final savedCredentials = await _repository.find();
    if (savedCredentials == null) return;

    final AuthCredentials(refreshToken : refreshToken) = savedCredentials;

    try {

      final renewedCredentials = await _client.renew(
          TokenRenewRequest(refreshToken: refreshToken));
      await _repository.save(renewedCredentials);

    } on DioException catch (e) {
      print(e);
      await _repository.delete();
    }

  }

}
