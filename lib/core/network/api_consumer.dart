import 'package:dio/dio.dart';

abstract class ApiConsumer {
  const ApiConsumer._();

  Future<Map<String, dynamic>> baseGET({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  });
  Future<Map<String, dynamic>> basePOST({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Options? options,
  });
  Future<Map<String, dynamic>> basePUT({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Options? options,
  });
  Future<Map<String, dynamic>> basePATCH({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Options? options,
  });
  Future<Map<String, dynamic>> baseDELETE({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}
