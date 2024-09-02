sealed class Result {}

final class Success<T> extends Result {

  final T? _data;

  Success() : _data = null;
  Success.data(this._data);

  T? get data => _data;

}

final class Fail<T> extends Result {

  final T? _data;

  Fail() : _data = null;
  Fail.data(this._data);

  T? get data => _data;

}