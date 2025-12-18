import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/features/intro/view/widgets/on_boarding_item.dart';

class OnBoardingConstants {
  const OnBoardingConstants._();
  static final List<OnBoardingItemModel> items = [
    OnBoardingItemModel(
        img: Assets.onBoardingPage1,
        title: "Book Your Appointment Easily",
        description:
            "Choose your preferred doctor, pick a suitable time, and confirm your visit in just a few taps. No calls, no waiting—just simple and fast booking."),
    OnBoardingItemModel(
        img: Assets.onBoardingPage2,
        title: "Find Doctors Around You",
        description:
            "Quickly discover trusted doctors near your area. Whether you needa general checkup or a specialist, we connect you with nearby clinics for fast and convenient care.")
  ];
}
