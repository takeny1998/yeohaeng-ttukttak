import 'package:flutter/material.dart';

import '../domain/auth_credentials.dart';
import '../repository/auth_credentials_repository.dart';
import 'oauth/oauth_service.dart';

class AuthService {
  final AuthCredentialsRepository _repository;
  final OAuthService _oauthService;

  AuthService(
      {required AuthCredentialsRepository repository,
      required OAuthService oauthService})
      : _repository = repository,
        _oauthService = oauthService;

  Future<AuthCredentials?> find() async {
    final credentials = await _repository.find();
    if (credentials == null) return credentials;

    final now = DateTime.now();

    debugPrint(
        '[AuthService.find()] expired=${now.isAfter(credentials.expiresAt)}');

    if (now.isAfter(credentials.expiresAt)) {
      await _repository.delete();
      return null;
    }

    return credentials;
  }

  Future<AuthCredentials> login() async {
    final credentials = await _oauthService.register();
    await _repository.save(credentials);

    return credentials;
  }

  Future<void> logout() async {
    final credentials = await find();
    if (credentials == null) return;

    await _repository.delete();
  }

  Future<void> deleteAccount() async {
    await _oauthService.revoke();
    await _repository.delete();
  }
}
