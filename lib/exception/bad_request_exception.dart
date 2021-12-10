class BadRequestException implements Exception {
  final _message;
  BadRequestException([this._message]);

  @override
  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}