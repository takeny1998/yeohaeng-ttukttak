import 'package:application/authentication/client/dto/oauth_register/oauth_register_request.dart';
import 'package:application/authentication/client/dto/oauth_register/oauth_register_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'oauth_client.g.dart';

@RestApi()
abstract class OAuthClient {

  factory OAuthClient(Dio dio, {String baseUrl}) = _OAuthClient;

  @POST("/api/v2/oauth2/apple/register")
  @Headers({ "Content-Type": "application/json"})
  Future<OAuthRegisterResponse> register(@Body() OAuthRegisterRequest request);

}