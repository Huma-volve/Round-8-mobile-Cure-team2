import 'package:cure_team_2/core/network/api_client.dart';
import 'package:cure_team_2/features/Favourite/data/datasource/Favourite_remote_data_source.dart';
import 'package:cure_team_2/features/Favourite/data/models/get_favourit/getFavouriteResponce.dart';
import 'package:cure_team_2/features/Favourite/data/models/post_favorite/PostFavouriteResponce.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:FavouriteRemoteDataSource )
class FavouriteApiRemoteDataSource implements FavouriteRemoteDataSource {
  final ApiClient _apiClient;

  FavouriteApiRemoteDataSource(this._apiClient);
  @override
  Future<PostFavouriteResponce> postFavourite({
    int? doctorId,
    String? token,
  }) async {
    final responce = await _apiClient.post("favorites-toggle/$doctorId");
    return PostFavouriteResponce.fromJson(responce.data);
  }

  @override
  Future<getFavouriteResponce> getFavourite() async {
    final responce = await _apiClient.get("favorites");
    return getFavouriteResponce.fromJson(responce.data);
  }
}
