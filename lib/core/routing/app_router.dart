
import 'package:cure_team_2/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../features/intro/view/splash_screen.dart';

class AppRouter {
   Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return null;
    }
  }
}
