import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/features/auth/presentation/pages/login_screen.dart';
import 'package:cure_team_2/features/auth/presentation/pages/otp_code_verification.dart';
import 'package:cure_team_2/features/auth/presentation/pages/signup_screen.dart';
import 'package:cure_team_2/features/intro/view/onboarding_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/add_card_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/add_new_card_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/credit_card_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/faqs_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/password_management_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/profile_screen.dart';
import 'package:cure_team_2/features/profile/presentation/pages/settings_screen.dart';
import 'package:cure_team_2/features/profile/presentation/payment_method_screen.dart';
import 'package:cure_team_2/features/profile/privacy_policy_screen.dart';
import 'package:flutter/material.dart';
import '../../features/intro/view/splash_screen.dart';

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
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.passwordManagement:
        return MaterialPageRoute(
            builder: (_) => const PasswordManagementScreen());
      case Routes.paymentMethod:
        return MaterialPageRoute(builder: (_) => const PaymentMethodScreen());
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

      default:
        return null;
    }
  }
}
