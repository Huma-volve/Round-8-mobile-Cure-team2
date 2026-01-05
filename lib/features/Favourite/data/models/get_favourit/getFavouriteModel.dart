import 'time.dart';

class Getfavouritemodel {
  final int id;
  final String name;
  final String specialty;
  final String hospitalName;
  final String price;
  final int expYears;
  final String image;
  final double rating;
  final List<Time> times;
  final bool isFavorite;

  const Getfavouritemodel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.hospitalName,
    required this.price,
    required this.expYears,
    required this.image,
    required this.rating,
    required this.times,
    required this.isFavorite,
  });

  factory Getfavouritemodel.fromJson(Map<String, dynamic> json) =>
      Getfavouritemodel(
        id: json['id'] as int,
        name: json['name'] as String,
        specialty: json['specialty'] as String,
        hospitalName: json['hospital_name'] as String,
        price: json['price'] as String,
        expYears: json['exp_years'] as int,
        image: json['image'] as String,
        rating: (json['rating'] as num).toDouble(),
        times:
            (json['times'] as List<dynamic>)
                .map((e) => Time.fromJson(e as Map<String, dynamic>))
                .toList(),
        isFavorite: json['is_favorite'] as bool,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'specialty': specialty,
    'hospital_name': hospitalName,
    'price': price,
    'exp_years': expYears,
    'image': image,
    'rating': rating,
    'times': times.map((e) => e.toJson()).toList(),
    'is_favorite': isFavorite,
  };
}
