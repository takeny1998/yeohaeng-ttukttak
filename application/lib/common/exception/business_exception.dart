class BusinessException extends Error {

  final String? message;

  BusinessException({this.message});

}

final class AuthorizationException extends BusinessException {

  AuthorizationException({super.message});
}