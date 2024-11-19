import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_model.freezed.dart';

@freezed
class SessionModel with _$SessionModel {

  const factory SessionModel({
    @Default(false) bool isAuthenticated,
    String? errorMessage,
  }) = _SessionModel;

}