import 'package:cure_team_2/features/Favourite/data/models/get_favourit/getFavouriteModel.dart';
import 'package:cure_team_2/features/Favourite/domain/entities/getFavouriteEntity.dart';

extension Getfavouritemappers on Getfavouritemodel {
  GetfavouriteEntity toEntity() => GetfavouriteEntity(
    id: id,
    name: name,
    specialty: specialty,
    hospitalName: hospitalName,
    price: price,
    expYears: expYears,
    image: image,
    rating: rating,
    times: times,
    isFavorite: isFavorite,
  );
}
