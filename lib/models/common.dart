class Result<T> {
  final bool success;
  final String message;
  final T? data;

  Result(this.success, this.message, [this.data]);
}
