abstract class BusinessException extends Error {}

final class AuthorizationException extends BusinessException {
  final String? message;

  AuthorizationException({this.message});
}