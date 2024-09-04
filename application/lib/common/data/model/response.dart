import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@Freezed(genericArgumentFactories: true, unionKey: 'status')
sealed class ServerResponse<T> with _$ServerResponse<T> {
  const factory ServerResponse.success({
    required T data,
  }) = ServerSuccessResponse;

  const factory ServerResponse.fail({
    String? message,
    Map<String, String>? data,
  }) = ServerFailResponse;

  const factory ServerResponse.error({
    required String message,
    int? code,
  }) = ServerErrorResponse;

  factory ServerResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ServerResponseFromJson(json, fromJsonT);
}
