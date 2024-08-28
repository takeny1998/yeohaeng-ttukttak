import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_redirect_response.freezed.dart';
part 'oauth_redirect_response.g.dart';

@freezed
class OAuthRedirectResponse with _$OAuthRedirectResponse {

  const factory OAuthRedirectResponse({
    required String redirectUri
}) = _OAuthRedirectResponse;

  factory OAuthRedirectResponse.fromJson(Map<String, dynamic> json) =>
      _$OAuthRedirectResponseFromJson(json);

}