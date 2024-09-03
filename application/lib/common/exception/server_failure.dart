import 'package:application/common/exception/failure.dart';

sealed class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

final class AuthenticationRenewFailure extends ServerFailure {
  AuthenticationRenewFailure({required super.message});
}