abstract class Result<T extends Object> {
  const Result();

  factory Result.ok(T value) = Ok._;

  factory Result.error(T value) = Error._;
}

final class Ok<T extends Object> extends Result<T> {
  const Ok._(this.value);

  final T value;
}

final class Error<T extends Object> extends Result<T> {
  const Error._(this.value);

  final T value;
}

extension ResultExtension on Object {
  Result ok() => Result.ok(this);
}

extension ResultException on Exception {
  Result error() => Result.error(this);
}

extension ResultCasting<T extends Object> on Result<T> {
  Ok<T> get asOk => this as Ok<T>;
}

extension ResultErrorCasting<T extends Object> on Result<T> {
  Error<T> get asError => this as Error<T>;
}
