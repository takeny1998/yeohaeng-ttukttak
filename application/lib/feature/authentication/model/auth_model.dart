import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';


@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel(
      {required String accessToken,
      required String refreshToken,
      required DateTime expiresAt}) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  factory AuthModel.fromResponse(Map<String, dynamic> json) {
    final expiresAt = DateTime.now().add(const Duration(minutes: 30));

    return AuthModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresAt: expiresAt,
    );
  }
}
