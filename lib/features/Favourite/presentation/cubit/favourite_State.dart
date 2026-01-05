abstract class FavouriteState {}

class InitialState extends FavouriteState {}

class LoadingState extends FavouriteState {}

class SuccessState extends FavouriteState {
  final String message;

  SuccessState(this.message);
}

class ErrorState extends FavouriteState {
  final String message;

  ErrorState(this.message);
}
