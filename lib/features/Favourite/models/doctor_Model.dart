import 'package:cure_team_2/core/constants/assets.dart';

class DoctorFavModel {
  final String doctorName;
  final String specialty;
  final String address;
  final String doctorImage;
  final String startTime;
  final String endTime;

  final String favoriteIcon;
  final String rating;
  final String starIcon;
  final String clockIcon;

  const DoctorFavModel({
    required this.doctorName,
    required this.specialty,
    required this.address,
    required this.doctorImage,
    required this.startTime,
    required this.endTime,

    required this.favoriteIcon,
    required this.rating,
    required this.starIcon,
    required this.clockIcon,
  });
}

const List<DoctorFavModel> favoriteDoctors = [
  DoctorFavModel(
    doctorName: 'Jennifer Miller',
    specialty: 'Orthopedic',
    address: ' | El-Nasr Hospital',
    doctorImage: Assets.FavPic1,
    favoriteIcon: Assets.favIconSolid,
    rating: '4.8',
    starIcon: Assets.Star,
    clockIcon: Assets.ClockCircle,
    startTime: '9:30am ',
    endTime: '8:00pm',
  ),
  DoctorFavModel(
    doctorName: 'Jennifer Miller',
    specialty: 'Orthopedic',
    address: ' | El-Nasr Hospital',
    doctorImage: Assets.FavPic2,
    favoriteIcon: Assets.favIconSolid,
    rating: '4.8',
    starIcon: Assets.Star,
    clockIcon: Assets.ClockCircle,
    startTime: '9:30am ',
    endTime: '8:00pm',
  ),
  DoctorFavModel(
    doctorName: 'Jennifer Miller',
    specialty: 'Orthopedic',
    address: ' | El-Nasr Hospital',
    doctorImage: Assets.FavPic3,
    favoriteIcon: Assets.favIconSolid,
    rating: '4.8',
    starIcon: Assets.Star,
    clockIcon: Assets.ClockCircle,
    startTime: '9:30am ',
    endTime: '8:00pm',
  ),
  DoctorFavModel(
    doctorName: 'Jennifer Miller',
    specialty: 'Orthopedic',
    address: ' | El-Nasr Hospital',
    doctorImage: Assets.FavPic4,
    favoriteIcon: Assets.favIconSolid,
    rating: '4.8',
    starIcon: Assets.Star,
    clockIcon: Assets.ClockCircle,
    startTime: '9:30am ',
    endTime: '8:00pm',
  ),
];
