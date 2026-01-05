import 'package:cure_team_2/core/error/exceptions.dart';
import 'package:cure_team_2/core/network/api_client.dart';
import 'package:cure_team_2/features/Favourite/data/datasource/Favourite_remote_data_source.dart';
import 'package:cure_team_2/features/Favourite/data/models/get_favourit/getFavouriteResponce.dart';
import 'package:cure_team_2/features/Favourite/data/models/post_favorite/PostFavouriteResponce.dart';
import 'package:dio/dio.dart';

class FavouriteApiRemoteDataSource implements FavouriteRemoteDataSource {
  final Dio _dio;

  FavouriteApiRemoteDataSource(this._dio);
  @override
  Future<PostFavouriteResponce> postFavourite({
    int? doctorId,
    String? token,
  }) async {
    try {
      final _dio = Dio(
        BaseOptions(
          baseUrl: ApiClient.baseUrl,
          headers: {
            "Accept": ApiClient.headersFavourite,
            "Authorization": "Bearer$token",
          },
        ),
      );

      final responce = await _dio.post("favorites-toggle/$doctorId");
      return PostFavouriteResponce.fromJson(responce.data);
    } catch (exeption) {
      String? message;
      if (exeption is DioException) {
        message = exeption.response?.data["message"];
      }
      throw RemoteException(message: message ?? "failed to post favourite");
    }
  }

  @override
  Future<getFavouriteResponce> getFavourite() async {
    try {
      final responce = await _dio.get(ApiClient.getFavourite);
      return getFavouriteResponce.fromJson(responce.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "failed to get favourite");
    }
  }
}
