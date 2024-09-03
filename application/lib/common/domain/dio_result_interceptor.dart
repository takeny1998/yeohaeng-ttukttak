import 'package:application/common/data/model/server_response.dart';
import 'package:dio/dio.dart';

class DioResultInterceptor extends Interceptor {

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    if (response == null) return handler.next(err);

    try {

      final Response(:data) = response;
      response.data = ServerErrorResponse(
          code: data['code'], message: data['message'], target: data['target']);

      return handler.resolve(response);

    } on Exception catch (e) {
      print('[DioExceptionHandler.onError()] Error: $e}');
      return handler.next(err);
    }
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //
  //   try {
  //
  //     final Response(:data) = response;
  //     response.data = ServerSuccessResponse(data:data['target']);
  //     return handler.next(response);
  //
  //   } on Exception catch (e) {
  //     print('[DioExceptionHandler.onError()] Error: $e}');
  //     return handler.next(response);
  //   }
  //
  //
  // }
}
