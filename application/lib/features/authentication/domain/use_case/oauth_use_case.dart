import 'dart:async';

import 'package:application/features/authentication/domain/dao/auth_repository.dart';
import 'package:application/features/authentication/domain/entity/auth_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../data/dao/auth_client.dart';

abstract interface class OAuthUseCase {
  Future<AuthEntity> signIn();
}

final class GoogleOAuthUseCase implements OAuthUseCase {
  final AuthRepository _repository;
  final AuthClient _client;

  GoogleOAuthUseCase(
      {required AuthRepository repository, required AuthClient client})
      : _repository = repository,
        _client = client;

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
  Future<AuthEntity> signIn() async {
    final credential = await _authorize();

    final model = await _client.signInGoogle(
        AuthSignInRequest(authorizationCode: credential!.serverAuthCode!));

    final entity = AuthEntity.fromModel(model);
    await _repository.save(entity);

    return entity;
  }
}

final class AppleOAuthUseCase implements OAuthUseCase {
  final AuthRepository _repository;
  final AuthClient _client;

  AppleOAuthUseCase(
      {required AuthRepository repository, required AuthClient client})
      : _repository = repository,
        _client = client;

  Future<AuthorizationCredentialAppleID> _authorize() =>
      SignInWithApple.getAppleIDCredential(
          scopes: [AppleIDAuthorizationScopes.email]);

  @override
  Future<AuthEntity> signIn() async {
    final credential = await _authorize();

    final model = await _client.signInApple(
        AuthSignInRequest(authorizationCode: credential.authorizationCode));

    final entity = AuthEntity.fromModel(model);
    await _repository.save(entity);

    return entity;
  }

}
