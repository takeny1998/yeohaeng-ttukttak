abstract class Failure {
  final String message;
  Failure({required this.message});
}

abstract class BusinessFailure extends Failure {
  BusinessFailure({required super.message});
}