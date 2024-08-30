import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_revoke_request.freezed.dart';
part 'oauth_revoke_request.g.dart';

@freezed
class OAuthRevokeRequest with _$OAuthRevokeRequest {

  const factory OAuthRevokeRequest({
      required String authorizationCode
  }) = _OAuthRevokeRequest;

  factory OAuthRevokeRequest.fromJson(Map<String, dynamic> json) =>
      _$OAuthRevokeRequestFromJson(json);

}