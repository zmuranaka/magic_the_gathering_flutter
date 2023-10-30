class BadDataError implements Exception {
  final dynamic message;
  BadDataError([this.message]);

  @override
  String toString() => message == null ? 'Bad Data' : 'Bad Data: $message';
}
