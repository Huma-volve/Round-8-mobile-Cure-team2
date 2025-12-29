
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException({required this.message, this.code, this.originalError});

  @override
  String toString() => message;
}
class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.code,
    super.originalError,
  });
}
class ServerException extends AppException {
  final int? statusCode;

  const ServerException({
    required super.message,
    this.statusCode,
    super.code,
    super.originalError,
  });
}
class ValidationException extends AppException {
  final Map<String, List<String>>? fieldErrors;
  const ValidationException({
    required super.message,
    this.fieldErrors,
    super.code,
    super.originalError,
  });
}
class UnknownException extends AppException {
  const UnknownException({
    required super.message,
    super.code,
    super.originalError,
  });
}
class AuthException extends AppException {
  const AuthException({
    required super.message,
    super.code,
    super.originalError,
  });
}

class CacheException extends AppException {
  const CacheException({
    required super.message,
    super.code,
    super.originalError,
  });
}