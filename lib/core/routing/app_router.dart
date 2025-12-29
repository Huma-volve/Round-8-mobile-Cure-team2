import 'package:cure_team_2/core/di/injection_container.dart';
import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/features/auth/presentation/pages/login_screen.dart';
import 'package:cure_team_2/features/auth/presentation/pages/otp_code_verification.dart';
import 'package:cure_team_2/features/auth/presentation/pages/signup_screen.dart';
import 'package:cure_team_2/features/intro/view/onboarding_screen.dart';
import 'package:cure_team_2/features/main/home/data/repository/home_repository.dart';
import 'package:cure_team_2/features/main/home/logic/specialists_cubit.dart';
import 'package:cure_team_2/features/main/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/intro/view/splash_screen.dart';
import '../../features/main/doctors/view/doctors_screen.dart';
import '../../features/main/doctors/view/specialists_screen.dart';
import '../../features/main/search/view/search_screen.dart';

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
      case Routes.main:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => SpecialistsCubit(
                    InjectionContainer.getIt.get<HomeRepository>())
                  ..get(),
                child: const MainLayout())
        );
      case Routes.search:
        final SpecialistsCubit specialistsCubit =
        settings.arguments as SpecialistsCubit;
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: specialistsCubit, child: const SearchScreen()));
      case Routes.specialists:
        final SpecialistsCubit specialistsCubit =
        settings.arguments as SpecialistsCubit;
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: specialistsCubit, child: const SpecialistsScreen()));
      case Routes.doctors:
        final SpecialistsCubit cubit =
        settings.arguments as SpecialistsCubit;
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: cubit, child: const DoctorsScreen()));
      default:
        return null;
    }
  }
}
