import 'package:application/features/authentication/data/dao/auth_client.dart';
import 'package:application/features/authentication/data/model/auth_model.dart';
import 'package:application/features/authentication/domain/dao/auth_repository.dart';

final class AuthUseCase {
  final AuthRepository _repository;
  final AuthClient _client;

  AuthUseCase({required AuthRepository repository, required AuthClient client})
      : _repository = repository,
        _client = client;

  Future<AuthModel?> find() async {
    final entity = await _repository.find();
    if (entity == null) return entity;
    return entity;
  }

  Future<void> signOut() async {
    final response = await _client.deleteToken();
    await _repository.delete();
  }

}
