import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/domain/member/member_model.dart';
import 'package:application_new/feature/authentication/model/auth_model.dart';
import 'package:application_new/feature/authentication/repository/auth_repository.dart';

final class AuthService {
  final AuthRepository _authRepository;
  final HttpService _httpService;

  AuthService({
    required AuthRepository authRepository,
    required HttpService httpService,
  })  : _authRepository = authRepository,
        _httpService = httpService;

  Future<MemberModel> register({
    required String provider,
    required String authorizationCode,
  }) async {
    final authResponse = await _httpService.post("/auth/login",
        options: ServerRequestOptions(authorize: false, data: {
          "provider": provider,
          "authorizationCode": authorizationCode,
        }));

    final authModel = AuthModel.fromResponse(authResponse);
    await _authRepository.save(authModel);

    return _findMember();
  }

  Future<MemberModel?> login() async {
    final auth = await _authRepository.find();
    if (auth == null) return null;
    return _findMember();
  }

  Future<MemberModel> _findMember() async {
    final memberResponse = await _httpService.get('/members/me');
    return MemberModel.fromJson(memberResponse['member']);
  }
}
