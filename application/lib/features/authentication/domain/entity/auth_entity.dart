import 'package:application/features/authentication/data/model/auth_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';
part 'auth_entity.g.dart';


@freezed
class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
  }) = _AuthEntity;

  factory AuthEntity.fromModel(AuthModel model) {
    final AuthModel(:accessToken, :refreshToken, :expiresIn) = model;
    final now = DateTime.now();
    final expiresAt = now.add(Duration(seconds: expiresIn));

    return AuthEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresAt: expiresAt);
  }

  factory AuthEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthEntityFromJson(json);
}
