import 'dart:async';
import 'dart:convert';

import 'package:application/features/authentication/domain/dao/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/auth_model.dart';

final class SecureStorageAuthRepository implements AuthRepository {
  final FlutterSecureStorage _storage;

  static const String key = 'auth_entity';

  SecureStorageAuthRepository({required FlutterSecureStorage storage})
      : _storage = storage;

  @override
  FutureOr<void> save(AuthModel model) async {
    final encoded = jsonEncode(model.toJson());
    await _storage.write(key: key, value: encoded);
  }

  @override
  FutureOr<AuthModel?> find() async {
    String? encoded = await _storage.read(key: key);
    return encoded != null ? AuthModel.fromJson(jsonDecode(encoded)) : null;
  }

  @override
  FutureOr<void> delete() async {
    await _storage.delete(key: key);
  }

}
