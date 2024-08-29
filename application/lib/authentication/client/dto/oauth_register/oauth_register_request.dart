import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_register_request.freezed.dart';
part 'oauth_register_request.g.dart';

@freezed
class OAuthRegisterRequest with _$OAuthRegisterRequest {

  const factory OAuthRegisterRequest({
    required String authorizationCode
}) = _OAuthRegisterRequest;

  factory OAuthRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$OAuthRegisterRequestFromJson(json);

}