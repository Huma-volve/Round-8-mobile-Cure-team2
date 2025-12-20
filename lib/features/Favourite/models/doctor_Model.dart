import 'package:cure_team_2/core/constants/assets.dart';

class DoctorFavModel {
  final String doctorName;
  final String specialty;
  final String address;
  final String doctorImage;

  final String favicon;
  final String rating;
  final String starIcon;
  final String ClockIcon;

  DoctorFavModel({
    required this.doctorName,
    required this.specialty,
    required this.address,
    required this.doctorImage,

    required this.favicon,
    required this.rating,
    required this.starIcon,
    required this.ClockIcon,
  });
}

List<DoctorFavModel> bookings = [
  DoctorFavModel(
    doctorName: 'Jennifer Miller',
    specialty: 'Orthopedic',
    address: ' | El-Nasr Hospital',
    doctorImage: Assets.FavPic1,
    favicon: Assets.favIconSolid,
    rating: '4.8',
    starIcon: Assets.Star,
    ClockIcon: Assets.ClockCircle,
  ),
  DoctorFavModel(
    doctorName: 'Jennifer Miller',
    specialty: 'Orthopedic',
    address: ' | El-Nasr Hospital',
    doctorImage: Assets.FavPic2,
    favicon: Assets.favIconSolid,
    rating: '4.8',
    starIcon: Assets.Star,
    ClockIcon: Assets.ClockCircle,
  ),
  DoctorFavModel(
    doctorName: 'Jennifer Miller',
    specialty: 'Orthopedic',
    address: ' | El-Nasr Hospital',
    doctorImage: Assets.FavPic3,
    favicon: Assets.favIconSolid,
    rating: '4.8',
    starIcon: Assets.Star,
    ClockIcon: Assets.ClockCircle,
  ),
  DoctorFavModel(
    doctorName: 'Jennifer Miller',
    specialty: 'Orthopedic',
    address: ' | El-Nasr Hospital',
    doctorImage: Assets.FavPic4,
    favicon: Assets.favIconSolid,
    rating: '4.8',
    starIcon: Assets.Star,
    ClockIcon: Assets.ClockCircle,
  ),
];
