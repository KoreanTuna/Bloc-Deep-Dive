/// Evaluate the result using a switch statement:
/// ```dart
/// switch (result) {
///   case Ok(): {
///     print(result.value);
///   }
///   case Error(): {
///     print(result.error);
///   }
/// }
library;

/// Result result = await logic();
/// result.when
///  (ok: (value) {
///   print(value);
/// },
/// error: (error) {
///  print(error);
/// });

sealed class Result<T> {
  const Result();

  const factory Result.ok(T value) = Ok._;
  const factory Result.error(Exception error) = Error._;

  void when({
    required void Function(T value) ok,
    required void Function(Exception error) error,
  }) {
    if (this is Ok<T>) {
      ok((this as Ok<T>).value);
      return;
    } else if (this is Error<T>) {
      error((this as Error<T>).error);
      return;
    }
  }

  R map<R>({
    required R Function(T value) ok,
    required R Function(Exception error) error,
  }) {
    if (this is Ok<T>) {
      return ok((this as Ok<T>).value);
    } else if (this is Error<T>) {
      return error((this as Error<T>).error);
    }
    throw Exception('Unknown result type');
  }
}

/// Subclass of Result for values
final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  /// Returned value in result
  final T value;
  @override
  String toString() => 'Result<$T>.ok($value)';
}

/// Subclass of Result for errors
final class Error<T> extends Result<T> {
  const Error._(this.error);

  /// Returned error in result
  final Exception error;
  @override
  String toString() => 'Result<$T>.error($error)';
}
