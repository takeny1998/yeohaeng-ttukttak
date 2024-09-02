import 'package:application/authentication/client/dto/oauth_register/oauth_register_request.dart';
import 'package:application/authentication/client/dto/oauth_register/oauth_register_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import 'dto/oauth_revoke/oauth_revoke_request.dart';

part 'oauth_client.g.dart';

@RestApi()
abstract class OAuthClient {

  factory OAuthClient(Dio dio, {String baseUrl}) = _OAuthClient;

  @POST("/api/v2/oauth2/apple")
  Future<OAuthRegisterResponse> registerApple(@Body() OAuthRegisterRequest request);

  @DELETE("/api/v2/oauth2/apple")
  Future<void> revokeApple(
      @Body() OAuthRevokeRequest request);

  @POST("/api/v2/oauth2/google")
  Future<OAuthRegisterResponse> registerGoogle(@Body() OAuthRegisterRequest request);

  @DELETE("/api/v2/oauth2/google")
  Future<void> revokeGoogle(
      @Body() OAuthRevokeRequest request);

}