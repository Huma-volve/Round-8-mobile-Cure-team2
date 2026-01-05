import 'package:cure_team_2/features/Favourite/data/models/post_favorite/PostFavouriteModel.dart';

extension Postfavouritemappers on PostFavouriteModel {
  PostFavouriteModel  toEntity ()=>
      PostFavouriteModel(added: added, isFavorite: isFavorite);
}
