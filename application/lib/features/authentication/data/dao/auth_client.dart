import 'package:application/common/data/model/response.dart';
import 'package:application/features/home/data/model/profile_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../model/auth_model.dart';

part 'auth_client.freezed.dart';
part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST("/api/v2/oauth2/apple")
  Future<ServerResponse<AuthModel>> signInApple(@Body() AuthSignInRequest request);

  @DELETE("/api/v2/oauth2/apple")
  Future<void> deleteApple(@Body() AuthDeleteRequest request);

  @POST("/api/v2/oauth2/google")
  Future<ServerResponse<AuthModel>> signInGoogle(@Body() AuthSignInRequest request);

  @DELETE("/api/v2/oauth2/google")
  Future<void> deleteGoogle(@Body() AuthDeleteRequest request);

  @POST("/api/v2/tokens/renew")
  Future<ServerResponse<AuthModel>> renewToken(@Body() AuthRenewRequest request);

  @DELETE("/api/v2/tokens")
  Future<ServerResponse> deleteToken();

  @GET("/api/v2/users/profile")
  @Headers({"Authentication": "required"})
  Future<ServerResponse<ProfileModel>> getProfile();
}


@freezed
class AuthSignInRequest with _$AuthSignInRequest {

  const factory AuthSignInRequest({
    required String authorizationCode,
    required String notificationToken
  }) = _AuthSignInRequest;

  factory AuthSignInRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthSignInRequestFromJson(json);

}

@freezed
class AuthDeleteRequest with _$AuthDeleteRequest {
  const factory AuthDeleteRequest({
    required String authorizationCode
  }) = _AuthDeleteRequest;

  factory AuthDeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthDeleteRequestFromJson(json);
}

@freezed
class AuthRenewRequest with _$AuthRenewRequest {
  const factory AuthRenewRequest({
    required String refreshToken
  }) = _AuthRenewRequest;

  factory AuthRenewRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRenewRequestFromJson(json);
}