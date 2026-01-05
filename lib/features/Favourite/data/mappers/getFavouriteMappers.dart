import 'package:cure_team_2/features/Favourite/data/models/get_favourit/getFavouriteModel.dart';

extension Getfavouritemappers on Getfavouritemodel {
  Getfavouritemodel toEntity() => Getfavouritemodel(
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
