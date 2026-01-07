
/// Base Exception
abstract class AppException implements Exception {
  final String? message;
  const AppException([this.message]);
}

// ===================== API Exceptions =====================

class ServerException extends AppException {
  const ServerException([String? message]) : super(message);
}

class RemoteException extends AppException {
  RemoteException([String? message]) : super(message);
}

class LocalException extends AppException {
  LocalException([String? message]) : super(message);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([String? message]) : super(message);
}

class ForbiddenException extends AppException {
  const ForbiddenException([String? message]) : super(message);
}

class NotFoundException extends AppException {
  const NotFoundException([String? message]) : super(message);
}

class BadRequestException extends AppException {
  const BadRequestException([String? message]) : super(message);
}

class ConflictException extends AppException {
  const ConflictException([String? message]) : super(message);
}

class InternalServerErrorException extends AppException {
  const InternalServerErrorException([String? message]) : super(message);
}

// ===================== Network Exceptions =====================

class NoInternetException extends AppException {
  const NoInternetException([String? message]) : super(message);
}

class RequestTimeoutException extends AppException {
  const RequestTimeoutException([String? message]) : super(message);
}

// // ===================== Firebase Exceptions =====================

// class FirebaseAuthExceptionCustom extends AppException {
//   const FirebaseAuthExceptionCustom([String? message]) : super(message);
// }

// class FirebaseFirestoreException extends AppException {
//   const FirebaseFirestoreException([String? message]) : super(message);
// }

// class FirebaseStorageException extends AppException {
//   const FirebaseStorageException([String? message]) : super(message);
// }

// ===================== Cache Exceptions =====================

class CacheException extends AppException {
  const CacheException([String? message]) : super(message);
}

// ===================== Unknown =====================

class UnknownException extends AppException {
  const UnknownException([String? message]) : super(message);
}
