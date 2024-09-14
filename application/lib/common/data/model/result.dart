sealed class Result<S, F> {}

final class Success<S, F> extends Result<S, F> {
  final S data;

  Success({required this.data});
}

final class Fail<S, F> extends Result<S, F> {
  final F? data;

  Fail({this.data});
}
