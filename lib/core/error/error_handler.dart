import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../network/api_constants.dart';
import 'exceptions.dart';

class ErrorHandler {
  static AppException handleError(error) {
    if (error is AppException) {
      return error;
    }
    if (error is DioException) {
      return _handleDioError(error);
    }
    if (error is SocketException) {
      return NetworkException(
        message: 'connectionError',
        code: 'NETWORK_ERROR',
        originalError: error,
      );
    }
    if (error is FormatException) {
      return ValidationException(
        message: 'validation error',
        code: 'FORMAT_ERROR',
        originalError: error,
      );
    }


    if (kDebugMode) {
      debugPrint('Unknown error: $error');
    }

    return UnknownException(
      message: 'unknown error try again later',
      code: 'UNKNOWN_ERROR',
      originalError: error,
    );
  }

  static AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          message: "server time out",
          code: 'TIMEOUT_ERROR',
          originalError: error,
        );

      case DioExceptionType.badResponse:
        return _handleServerError(error);

      case DioExceptionType.cancel:
        return NetworkException(
          message: 'request canncelled',
          code: 'REQUEST_CANCELLED',
          originalError: error,
        );

      case DioExceptionType.connectionError:
        return NetworkException(
          message: 'connection error',
          code: 'CONNECTION_ERROR',
          originalError: error,
        );

      default:
        return UnknownException(
          message: 'unknown error ',
          code: 'DIO_ERROR',
          originalError: error,
        );
    }
  }

  static AppException _handleServerError(DioException error) {
    final data = error.response?.data;
    int? statusCode;

    if (data is Map) {
      statusCode = data['error']?['statusCode'] ?? error.response?.statusCode;
    } else {
      statusCode = error.response?.statusCode;
    }

    switch (statusCode) {
      case ApiConstants.badRequest:
        return ValidationException(
          message: 'validation error',
          code: 'BAD_REQUEST',
          originalError: error,
        );

      case ApiConstants.unauthorized:
        return AuthException(
          message: 'un authorized please sign in before that',
          code: 'UNAUTHORIZED',
          originalError: error,
        );

      case ApiConstants.forbidden:
        return AuthException(
          message: 'its forbidden',
          code: 'FORBIDDEN',
          originalError: error,
        );

      case ApiConstants.notFound:
        return ServerException(
          message: 'notfound',
          statusCode: statusCode,
          code: 'NOT_FOUND',
          originalError: error,
        );

      case ApiConstants.unProcessable:
        return ValidationException(
          message: '',
          code: 'UNPROCESSABLE_ENTITY',
          originalError: error,
        );

      case ApiConstants.serverError:
        return ServerException(
          message: '',
          statusCode: statusCode,
          code: 'SERVER_ERROR',
          originalError: error,
        );



      default:
        return ServerException(
          message: '',
          statusCode: statusCode,
          code: '$statusCode',
          originalError: error,
        );
    }
  }


  static void logError(AppException exception, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      debugPrint('Error Type: ${exception.runtimeType}');
      debugPrint('Error Message: ${exception.message}');
      debugPrint('Error Code: ${exception.code}');
      if (exception.originalError != null) {
        debugPrint('Original Error: ${exception.originalError}');
      }
      if (stackTrace != null) {
        debugPrint('Stack Trace: $stackTrace');
      }
    }
  }

}
