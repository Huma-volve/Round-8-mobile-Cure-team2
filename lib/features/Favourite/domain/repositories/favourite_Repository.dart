import 'package:cure_team_2/core/error/failures.dart';
import 'package:cure_team_2/features/Favourite/domain/entities/getFavouriteEntity.dart';
import 'package:cure_team_2/features/Favourite/domain/entities/postFavouriteEntity.dart';
import 'package:dartz/dartz.dart';

abstract class FavouriteRepository {
  Future<Either<Failure, PostfavouriteEntity>> postFavourite({
    String? doctorId,
  });
  Future<Either<Failure, List<GetfavouriteEntity>>> getFavourite();
}
