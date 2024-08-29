import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_renew_request.freezed.dart';
part 'token_renew_request.g.dart';

@freezed
class TokenRenewRequest with _$TokenRenewRequest {
  const factory TokenRenewRequest({required String refreshToken}) =
      _TokenRenewRequest;

  factory TokenRenewRequest.fromJson(Map<String, dynamic> json) =>
      _$TokenRenewRequestFromJson(json);
}
