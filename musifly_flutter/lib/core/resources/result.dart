abstract class Result<T> {
  final bool success;

  T get data {
    if (this is! _ResultSuccess) {
      throw Exception('This is not ResultSuccess!');
    }
    return (this as _ResultSuccess)._data;
  }

  String get error {
    if (this is! _ResultFailure) {
      throw Exception('This is not ResultFailure!');
    }
    return (this as _ResultFailure)._error;
  }

  Result._(this.success);

  factory Result.success(T data) {
    return _ResultSuccess(data);
  }

  factory Result.failure(String error) {
    return _ResultFailure(error);
  }
}

class _ResultSuccess<T> extends Result<T> {
  final T _data;

  _ResultSuccess(this._data) : super._(true);
}

class _ResultFailure<T> extends Result<T> {
  final String _error;

  _ResultFailure(this._error) : super._(false);
}
