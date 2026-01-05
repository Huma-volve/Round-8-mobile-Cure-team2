import 'package:cure_team_2/core/error/failures.dart';
import 'package:cure_team_2/features/Favourite/domain/entities/getFavouriteEntity.dart';
import 'package:cure_team_2/features/Favourite/domain/repositories/favourite_Repository.dart';
import 'package:dartz/dartz.dart';

class GetfavouriteUseCase {
  final FavouriteRepository _favouriteRepository;

  GetfavouriteUseCase(this._favouriteRepository);
  Future<Either<Failure, List<GetfavouriteEntity>>> call() =>
      _favouriteRepository.getFavourite();
}
