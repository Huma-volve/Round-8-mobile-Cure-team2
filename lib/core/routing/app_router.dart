import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/features/auth/presentation/pages/login_screen.dart';
import 'package:cure_team_2/features/auth/presentation/pages/otp_code_verification.dart';
import 'package:cure_team_2/features/auth/presentation/pages/signup_screen.dart';
import 'package:cure_team_2/features/bookingAppointment/screens/Payment_Method.dart';
import 'package:cure_team_2/features/bookingAppointment/screens/bookingAppointment.dart';
import 'package:cure_team_2/features/bookingAppointment/screens/your_appointment.dart';
import 'package:cure_team_2/features/intro/view/onboarding_screen.dart';
import 'package:cure_team_2/features/intro/view/splash_screen.dart';
import 'package:cure_team_2/features/tabs/screens/myBooking.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.otp:
        return MaterialPageRoute(builder: (_) => const OtpCodeVerification());
      case Routes.bookappointment:
        return MaterialPageRoute(builder: (_) => const Bookingappointment());
      case Routes.paymentmethod:
        return MaterialPageRoute(builder: (_) => const PaymentMethod());
      case Routes.mybooking:
        return MaterialPageRoute(builder: (_) => const Mybooking());
      case Routes.yourAppointment:
        return MaterialPageRoute(builder: (_) => const YourAppointment());

      default:
        return null;
    }
  }
}
