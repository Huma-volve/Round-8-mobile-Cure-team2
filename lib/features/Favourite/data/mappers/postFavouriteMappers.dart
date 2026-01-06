import 'package:cure_team_2/features/Favourite/data/models/post_favorite/PostFavouriteModel.dart';
import 'package:cure_team_2/features/Favourite/domain/entities/postFavouriteEntity.dart';

extension Postfavouritemappers on PostFavouriteModel {
  PostfavouriteEntity  toEntity ()=>
      PostfavouriteEntity(added: added, isFavorite: isFavorite);
}
