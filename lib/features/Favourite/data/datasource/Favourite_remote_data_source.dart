import 'package:cure_team_2/features/Favourite/data/models/get_favourit/getFavouriteResponce.dart';
import 'package:cure_team_2/features/Favourite/data/models/post_favorite/PostFavouriteResponce.dart';

abstract class FavouriteRemoteDataSource {
  Future<PostFavouriteResponce> postFavourite({
    int? doctorId,
    String? token,
  });
  Future<getFavouriteResponce> getFavourite();
}
