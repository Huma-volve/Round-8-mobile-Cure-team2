import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';
import 'dio_interceptors.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = ApiConstants.connectTimeout
        ..options.receiveTimeout = ApiConstants.receiveTimeout;
      _addDioInterceptor();
    }
    return dio!;
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void clearHeadersOnLogout() {
    dio?.options.headers = {'Accept': 'application/json'};
  }

  static void _addDioInterceptor() {
    dio?.interceptors.add(AppInterceptor(dio!));
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
