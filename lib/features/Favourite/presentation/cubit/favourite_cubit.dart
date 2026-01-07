import 'package:cure_team_2/features/Favourite/data/repositories/favourite_RepositoryImpl.dart';
import 'package:cure_team_2/features/Favourite/presentation/cubit/favourite_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this._favouriteRepositoryimpl) : super(InitialState());
  final FavouriteRepositoryimpl _favouriteRepositoryimpl;
  Future<void> postfavourite({String? doctorId}) async {
    if (isClosed) {
      return;
    }

    emit(LoadingState());

    final result = await _favouriteRepositoryimpl.postFavourite(
      doctorId: doctorId,
    );

    result.fold(
      (failure) {
        emit(ErrorState(failure.message!));
      },
      (Postfavourite) {
        emit(SuccesspostFavouriteState(Postfavourite));
      },
    );
  }

  Future<void> getfavourite() async {
    if (isClosed) {
      return;
    }

    emit(LoadingState());

    final result = await _favouriteRepositoryimpl.getFavourite();

    result.fold(
      (failure) {
        emit(ErrorState(failure.message!));
      },
      (Getfavourite) {
        emit(SuccessgetFavouriteState(Getfavourite));
      },
    );
  }
}
