import 'package:cure_team_2/features/Favourite/domain/entities/getFavouriteEntity.dart';
import 'package:cure_team_2/features/Favourite/domain/entities/postFavouriteEntity.dart';

abstract class FavouriteState {}

class InitialState extends FavouriteState {}

class LoadingState extends FavouriteState {}

class SuccessgetFavouriteState extends FavouriteState {
  final List<GetfavouriteEntity> getfavourite;

  SuccessgetFavouriteState(this.getfavourite);
}

class SuccesspostFavouriteState extends FavouriteState {
  final PostfavouriteEntity Postfavourite;

  SuccesspostFavouriteState(this.Postfavourite);
}

class ErrorState extends FavouriteState {
  final String message;

  ErrorState(this.message);
}
