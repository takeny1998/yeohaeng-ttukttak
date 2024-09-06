import 'dart:async';

import 'package:application/common/data/model/response.dart';
import 'package:application/features/authentication/data/model/auth_model.dart';
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
  final String _notificationToken;

  GoogleOAuthUseCase(
      {required AuthRepository repository,
      required AuthClient client,
      required String notificationToken})
      : _repository = repository,
        _client = client,
        _notificationToken = notificationToken;

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
    final authorizationCode = credential!.serverAuthCode!;

    final response = await _client.signInGoogle(AuthSignInRequest(
        authorizationCode: authorizationCode,
        notificationToken: _notificationToken));

    throw UnimplementedError();

    // switch (response) {
    //   case ServerSuccessResponse<AuthModel>(:final data):
    //     final entity = AuthEntity.fromModel(data!);
    //     await _repository.save(entity);
    //     return entity;
    //   case ServerFailResponse<AuthModel>():
    //     throw Error();
    // }
  }
}

final class AppleOAuthUseCase implements OAuthUseCase {
  final AuthRepository _repository;
  final AuthClient _client;
  final String _notificationToken;

  AppleOAuthUseCase(
      {required AuthRepository repository,
      required AuthClient client,
      required String notificationToken})
      : _repository = repository,
        _client = client,
        _notificationToken = notificationToken;

  Future<AuthorizationCredentialAppleID> _authorize() =>
      SignInWithApple.getAppleIDCredential(
          scopes: [AppleIDAuthorizationScopes.email]);

  @override
  Future<AuthEntity> signIn() async {
    final credential = await _authorize();
    final authorizationCode = credential.authorizationCode;

    final response = await _client.signInApple(AuthSignInRequest(
        authorizationCode: authorizationCode,
        notificationToken: _notificationToken));

    switch (response) {
      case ServerSuccessResponse<AuthModel>(:final data):
        final entity = AuthEntity.fromModel(data);
        await _repository.save(entity);
        return entity;
      case ServerFailResponse<AuthModel>():
      case ServerErrorResponse<AuthModel>():
        throw Error();
    }
  }
}
