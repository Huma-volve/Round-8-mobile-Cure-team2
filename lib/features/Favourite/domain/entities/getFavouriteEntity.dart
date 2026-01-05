import 'package:cure_team_2/features/Favourite/data/models/get_favourit/time.dart';

class GetfavouriteEntity {
  final int? id;
  final String? name;
  final String? specialty;
  final String? hospitalName;
  final String? price;
  final int? expYears;
  final String? image;
  final double? rating;
  final List<Time>? times;
  final bool? isFavorite;

  const GetfavouriteEntity({
    this.id,
    this.name,
    this.specialty,
    this.hospitalName,
    this.price,
    this.expYears,
    this.image,
    this.rating,
    this.times,
    this.isFavorite,
  });
}
