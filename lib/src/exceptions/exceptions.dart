class InvalidArgumentException implements Exception {
  final String argumentName;
  final dynamic invalidArgumentValue;

  InvalidArgumentException(this.argumentName, this.invalidArgumentValue);

  @override
  String toString() {
    return "$argumentName can't be $invalidArgumentValue.";
  }
}
