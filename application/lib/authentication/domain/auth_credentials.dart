import 'package:application/authentication/client/dto/oauth_register/oauth_register_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_credentials.freezed.dart';
part 'auth_credentials.g.dart';

@freezed
class AuthCredentials with _$AuthCredentials {
  const factory AuthCredentials(
      {required String accessToken,
      required String refreshToken,
      required DateTime expiresAt}) = _AuthCredentials;

  factory AuthCredentials.fromJson(Map<String, dynamic> json) =>
      _$AuthCredentialsFromJson(json);

  factory AuthCredentials.fromResponse(OAuthRegisterResponse response) {
    final OAuthRegisterResponse(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresIn: expiresIn) = response;

    final now = DateTime.now();
    final expiresAt = now.add(Duration(seconds: expiresIn));

    return AuthCredentials(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresAt: expiresAt);
  }
}
