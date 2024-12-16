import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_response.freezed.dart';
part 'server_response.g.dart';

@Freezed(unionKey: 'status')
sealed class ServerResponse with _$ServerResponse {

  const factory ServerResponse.success({
    @Default({}) Map<String, dynamic> data,
  }) = ServerSuccessResponse;

  const factory ServerResponse.fail({
    @Default({}) Map<String, dynamic> data,
  }) = ServerFailResponse;

  const factory ServerResponse.error({
    required String code,
    required String message,
  }) = ServerErrorResponse;

  factory ServerResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerResponseFromJson(json);

}
