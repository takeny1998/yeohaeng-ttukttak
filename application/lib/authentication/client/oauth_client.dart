import 'package:application/authentication/client/dto/oauth_redirect_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'oauth_client.g.dart';

@RestApi()
abstract class OAuthClient {

  factory OAuthClient(Dio dio, {String baseUrl}) = _OAuthClient;
  
  @GET("/api/v2/oauth2/apple")
  Future<OAuthRedirectResponse> apple(
      @Query("action") String action);

}