import 'package:application/common/data/model/response.dart';
import 'package:application/features/authentication/data/dao/auth_client.dart';
import 'package:application/features/authentication/domain/dao/auth_repository.dart';
import 'package:application/features/authentication/domain/entity/auth_entity.dart';
import 'package:dio/dio.dart';

final class AuthUseCase {
  final AuthRepository _repository;
  final AuthClient _client;

  AuthUseCase({required AuthRepository repository, required AuthClient client})
      : _repository = repository,
        _client = client;

  Future<AuthEntity?> find() async {
    final entity = await _repository.find();
    if (entity == null) return entity;
    return entity;
  }

  Future<void> signOut() async {
    final response = await _client.deleteToken();
    await _repository.delete();
  }

}
