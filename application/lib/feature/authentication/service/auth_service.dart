import 'package:application_new/common/exception/exception.dart';
import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/feature/authentication/model/auth_model.dart';
import 'package:application_new/feature/authentication/repository/auth_repository.dart';

final class AuthService {
  final AuthRepository _authRepository;
  final HttpService _httpService;

  AuthService(
      {required AuthRepository authRepository,
      required HttpService httpService})
      : _authRepository = authRepository,
        _httpService = httpService;

  Future<AuthModel> find() async {
    final authModel = await _authRepository.find();

    if (authModel == null) {
      throw AuthenticatedException();
    }

    final isExpired = authModel.expiresAt.isBefore(DateTime.now());

    if (isExpired) {
      return await renew(authModel);
    }

    return authModel;
  }

  Future<AuthModel> renew(AuthModel authModel) async {
    final response = await _httpService.request(
      "POST",
      "/api/v2/auth/renew",
      data: {
        "refreshToken": authModel.refreshToken,
      },
    ).catchError((error) {
      if (error is ServerException) {
        _authRepository.delete();
        throw AuthenticatedException();
      }
      throw error;
    });

    final renewedAuthModel = AuthModel.fromResponse(response);
    await _authRepository.save(renewedAuthModel);

    return renewedAuthModel;
  }

  Future<void> login({
    required String provider,
    required String authorizationCode,
  }) async {
    final response = await _httpService.request("POST", "/api/v2/auth/login",
        data: {
          "provider": provider,
          "authorizationCode": authorizationCode
        });

    final authModel = AuthModel.fromResponse(response);
    await _authRepository.save(authModel);
  }
}
