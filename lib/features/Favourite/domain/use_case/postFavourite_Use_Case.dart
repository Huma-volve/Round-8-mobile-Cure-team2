import 'package:cure_team_2/core/error/failures.dart';
import 'package:cure_team_2/features/Favourite/domain/entities/postFavouriteEntity.dart';
import 'package:cure_team_2/features/Favourite/domain/repositories/favourite_Repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@LazySingleton()
class PostfavouriteUseCase {
  final FavouriteRepository _favouriteRepository;

  PostfavouriteUseCase(this._favouriteRepository);
  Future<Either<Failure, PostfavouriteEntity>> call() =>
      _favouriteRepository.postFavourite();
}
