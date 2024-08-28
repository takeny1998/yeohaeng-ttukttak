
import 'package:application/authentication/client/dto/token_renew_request.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';


import '../domain/auth_credentials.dart';

part 'token_client.g.dart';

@RestApi()
abstract class TokenClient {

  factory TokenClient(Dio dio, { String baseUrl }) = _TokenClient;

  @POST("/api/v2/tokens/renew")
  @Headers({ 'Content-Type': 'application/json' })
  Future<AuthCredentials> renew(@Body() TokenRenewRequest request);

}