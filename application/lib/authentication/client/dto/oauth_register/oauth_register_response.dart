import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_register_response.freezed.dart';
part 'oauth_register_response.g.dart';


@freezed
class OAuthRegisterResponse with _$OAuthRegisterResponse {

  const factory OAuthRegisterResponse({
      required String accessToken,
      required String refreshToken
  }) = _OAuthRegisterResponse;

  factory OAuthRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$OAuthRegisterResponseFromJson(json);
}