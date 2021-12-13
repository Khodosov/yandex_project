class ResponseException implements Exception {
  final _message;

  ResponseException([this._message]);

  @override
  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
