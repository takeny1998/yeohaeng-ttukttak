import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

sealed class ServerResponse {}

@Freezed(genericArgumentFactories: true)
final class ServerSuccessResponse<T> extends ServerResponse with _$ServerSuccessResponse  {
  const factory ServerSuccessResponse({required T data}) = _ServerSuccessResponse;

  factory ServerSuccessResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ServerSuccessResponseFromJson(json, fromJsonT);
}

@freezed
class ServerErrorResponse extends ServerResponse with _$ServerErrorResponse {
  const factory ServerErrorResponse(
      {required String code,
      required String message,
      String? target}) = _ServerErrorResponse;

  factory ServerErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorResponseFromJson(json);
}
 