// ignore_for_file: prefer_typing_uninitialized_variables

class RequestException implements Exception {
  final _message;

  RequestException([this._message]);

  @override
  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
