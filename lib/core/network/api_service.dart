import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'api_consumer.dart';

class ApiService implements ApiConsumer {
  final Dio dio;
  const ApiService(this.dio);

  @override
  Future<Map<String, dynamic>> baseGET({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
    );

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> basePOST({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Options? options,
  }) async {
    final response = await dio.post(
      ApiConstants.baseUrl + endPoint,
      data: body,
      options: options,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> basePUT({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Options? options,
  }) async {
    final response = await dio.put(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      data: body,
      options: options,
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> basePATCH({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Options? options,
  }) async {
    final response = await dio.patch(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      data: body,
      options: options,
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> baseDELETE({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    dynamic body,
  }) async {
    final response = await dio.delete(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      data: body,
      options: options,
    );
    return response.data;
  }
}
