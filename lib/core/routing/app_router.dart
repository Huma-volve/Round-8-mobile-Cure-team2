import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/features/Favourite/presentation/Screens/add_Favourite.dart';
import 'package:cure_team_2/features/auth/presentation/pages/login_screen.dart';
import 'package:cure_team_2/features/bookingAppointment/presentation/screens/bookingAppointment.dart';
import 'package:cure_team_2/features/chat/presentation/pages/chat_detail_screen.dart';
// Chat
import 'package:cure_team_2/features/chat/presentation/pages/chat_list_screen.dart';
// Auth & Profile

// Intro
import 'package:cure_team_2/features/intro/view/onboarding_screen.dart';
// Intro
import 'package:cure_team_2/features/intro/view/splash_screen.dart';
// Notifications
import 'package:cure_team_2/features/notifications/presentation/pages/notification_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/add_card_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/add_new_card_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/credit_card_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/faqs_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/password_management_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/profile_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/settings_screen.dart';
import 'package:cure_team_2/features/profile/privacy_policy_screen.dart';
import 'package:cure_team_2/features/review/review_view.dart';
import 'package:cure_team_2/features/tabs/navbar.dart';
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
        // Placeholder for missing SignupScreen
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Signup Screen Placeholder')),
              ),
        );
      case Routes.otp:
        // Placeholder for missing OtpCodeVerification
        return MaterialPageRoute(
          builder:
              (context) => Scaffold(
                appBar: AppBar(title: const Text("OTP Verification")),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('OTP Screen Placeholder'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.navbar,
                            (route) => false,
                          );
                        },
                        child: const Text("Verify & Login"),
                      ),
                    ],
                  ),
                ),
              ),
        );

      case Routes.navbar:
        return MaterialPageRoute(builder: (_) => const Navbar());

      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.passwordManagement:
        return MaterialPageRoute(
          builder: (_) => const PasswordManagementScreen(),
        );
      case Routes.paymentMethod:
        // Placeholder for missing PaymentMethodScreen (conflict with PaymentMethod in booking)
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Payment Method Screen Placeholder')),
              ),
        );
      case Routes.privacyPolicy:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      case Routes.faqs:
        return MaterialPageRoute(builder: (_) => const FaqsScreen());
      case Routes.creditCard:
        return MaterialPageRoute(builder: (_) => const CreditCardScreen());
      case Routes.addCard:
        return MaterialPageRoute(builder: (_) => const AddCardScreen());
      case Routes.addNewCard:
        return MaterialPageRoute(builder: (_) => const AddNewCardScreen());

      case Routes.chatList:
        return MaterialPageRoute(builder: (_) => const ChatListScreen());
      case Routes.review:
        return MaterialPageRoute(builder: (_) => const ReviewView());
      case Routes.chatDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => ChatDetailScreen(
                chatId: args['chatId'],
                chatName: args['chatName'],
              ),
        );

      case Routes.bookappointment:
        return MaterialPageRoute(builder: (_) => const Bookingappointment());
      case Routes.favoritePage:
        return MaterialPageRoute(
          builder: (_) => const AddFavourite(),
          settings: settings,
        );
      case Routes.paymentmethod:
        // Placeholder for missing PaymentMethod
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Payment Method Placeholder')),
              ),
        );

      case Routes.yourAppointment:
        // Placeholder for missing YourAppointment
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Your Appointment Placeholder')),
              ),
        );
      case Routes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());

      default:
        return null;
    }
  }
}
