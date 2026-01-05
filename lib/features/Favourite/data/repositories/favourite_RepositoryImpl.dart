import 'package:cure_team_2/core/error/exceptions.dart';
import 'package:cure_team_2/core/error/failures.dart';
import 'package:cure_team_2/features/Favourite/data/datasource/Favourite_remote_data_source.dart';
import 'package:cure_team_2/features/Favourite/data/mappers/getFavouriteMappers.dart';
import 'package:cure_team_2/features/Favourite/data/mappers/postFavouriteMappers.dart';
import 'package:cure_team_2/features/Favourite/domain/entities/getFavouriteEntity.dart';
import 'package:cure_team_2/features/Favourite/domain/entities/postFavouriteEntity.dart';
import 'package:cure_team_2/features/Favourite/domain/repositories/favourite_Repository.dart';
import 'package:dartz/dartz.dart';

class FavouriteRepositoryimpl implements FavouriteRepository {
  final FavouriteRemoteDataSource _favouriteRemoteDataSource;

  FavouriteRepositoryimpl(this._favouriteRemoteDataSource);

  @override
  Future<Either<Failure, PostfavouriteEntity>> postFavourite({
    String? doctorId,
  }) async {
    try {
      final responce = await _favouriteRemoteDataSource.postFavourite(
        doctorId: int.parse(doctorId!),
      );

      final entity = responce.data!.toEntity();

      return Right(entity as PostfavouriteEntity);
    } on RemoteException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<GetfavouriteEntity>>> getFavourite() async {
    try {
      final responce = await _favouriteRemoteDataSource.getFavourite();

      final entities = responce.data!.map((e) => e.toEntity()).toList();

      return Right(entities.cast<GetfavouriteEntity>());
    } on RemoteException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
