import 'package:cure_team_2/core/database/db_constants.dart';
import 'package:dio/dio.dart';

import '../database/secure_storage_helper.dart';

class AppInterceptor extends Interceptor {
  final Dio _dio;

  AppInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await SecureStorageHelper.getSecureString(
      DbConstants.accessToken,
    );
    if (token != null) {
      options.headers['Accept'] = 'application/json';
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await SecureStorageHelper.getSecureString(
        DbConstants.refreshToken,
      );

      if (refreshToken != null) {
        try {
          final response = await _dio.post(
            '/auth/refresh',
            data: {'refreshToken': refreshToken},
          );

          final newAccessToken = response.data['accessToken'];
          await SecureStorageHelper.setSecureString(
            DbConstants.accessToken,
            newAccessToken,
          );

          err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          final clonedRequest = await _dio.fetch(err.requestOptions);
          return handler.resolve(clonedRequest);
        } catch (e) {
          await SecureStorageHelper.deleteSecureString(DbConstants.accessToken);
          await SecureStorageHelper.deleteSecureString(DbConstants.refreshToken);
          return handler.reject(err);
        }
      }
    }
    super.onError(err, handler);
  }
}