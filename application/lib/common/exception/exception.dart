
sealed class BusinessException extends Error {}

final class ServerException extends BusinessException {

  final String message;

  ServerException({required this.message});

}

final class NetworkException extends BusinessException {

  final int? code;
  final String? message;

  NetworkException({required this.code, required this.message});

}

class AuthenticatedException extends BusinessException {}