
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_api.g.dart';

@RestApi()
abstract class RemoteApi {

  factory RemoteApi(Dio dio, {String baseUrl}) = _RemoteApi;

}