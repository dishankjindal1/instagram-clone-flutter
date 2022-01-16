abstract class BaseException implements Exception {
  final String? _prefix;
  final String? _message;

  BaseException(this._prefix, this._message);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class UnknownException extends BaseException {
  UnknownException(String? message) : super('Unknown Exception', message);
}

class AuthServiceException extends BaseException {
  AuthServiceException(String? message)
      : super('AuthService Exception', message);
}
