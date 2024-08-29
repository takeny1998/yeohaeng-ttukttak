
import 'dart:convert';

import 'package:application/authentication/domain/auth_credentials.dart';
import 'package:application/authentication/repository/auth_credentials_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageAuthCredentialsRepository implements AuthCredentialsRepository {

  final FlutterSecureStorage _secureStorage;

  static const String key = 'auth_credentials';

  SecureStorageAuthCredentialsRepository(this._secureStorage);

  @override
  Future<void> delete(AuthCredentials authCredentials) async {

    _secureStorage.delete(key: key);

  }

  @override
  Future<AuthCredentials?> find() async {

    String? jsonString = await _secureStorage.read(key: key);

    if (jsonString == null) return null;

    return AuthCredentials.fromJson(jsonDecode(jsonString));

  }

  @override
  Future<void> save(AuthCredentials authCredentials) async {

    final encoded = jsonEncode(authCredentials.toJson());

    await _secureStorage.write(key: key, value: encoded);

  }

}