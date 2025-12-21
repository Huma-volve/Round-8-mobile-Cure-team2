import 'package:cure_team_2/core/routing/routes.dart';
import 'package:flutter/material.dart';

// Auth & Profile
import 'package:cure_team_2/features/auth/presentation/pages/login_screen.dart';
import 'package:cure_team_2/features/auth/presentation/pages/otp_code_verification.dart';
import 'package:cure_team_2/features/auth/presentation/pages/signup_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/profile_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/edit_profile_screen.dart';

// Intro
import 'package:cure_team_2/features/intro/view/onboarding_screen.dart';
import 'package:cure_team_2/features/intro/view/splash_screen.dart';

// Chat
import 'package:cure_team_2/features/chat/presentation/pages/chat_list_screen.dart';
import 'package:cure_team_2/features/chat/presentation/pages/chat_detail_screen.dart';

// Home / search / favorite / doctors / specialties
import 'package:cure_team_2/features/home/presentation/pages/home/pages/home_page.dart';
import 'package:cure_team_2/features/home/presentation/pages/favorite/pages/favorite_page.dart';
import 'package:cure_team_2/features/home/presentation/pages/doctors/presentation/pages/doctors_page.dart';
import 'package:cure_team_2/features/home/presentation/pages/specialties/presentation/pages/specialties_page.dart';
import 'package:cure_team_2/features/search/presentation/pages/search_page.dart';

// Notifications
import 'package:cure_team_2/features/notifications/presentation/pages/notification_screen.dart';

// Booking
import 'package:cure_team_2/features/bookingAppointment/screens/Payment_Method.dart';
import 'package:cure_team_2/features/bookingAppointment/screens/bookingAppointment.dart';
import 'package:cure_team_2/features/bookingAppointment/screens/your_appointment.dart';

// Tabs

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
      case Routes.chatList:
        return MaterialPageRoute(builder: (_) => const ChatListScreen());
      case Routes.chatDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ChatDetailScreen(
            chatId: args['chatId'],
            chatName: args['chatName'],
          ),
        );
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.searchPage:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case Routes.favoritePage:
        return MaterialPageRoute(builder: (_) => const FavoritePage());
      case Routes.doctorsPage:
        return MaterialPageRoute(builder: (_) => const DoctorsPage());
      case Routes.specialtiesPage:
        return MaterialPageRoute(builder: (_) => const SpecialtiesPage());
      case Routes.bookappointment:
        return MaterialPageRoute(builder: (_) => const Bookingappointment());
      case Routes.paymentmethod:
        return MaterialPageRoute(builder: (_) => const PaymentMethod());
      
      case Routes.yourAppointment:
        return MaterialPageRoute(builder: (_) => const YourAppointment());
      case Routes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      default:
        return null;
    }
  }
}
