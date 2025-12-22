import 'package:cure_team_2/core/routing/routes.dart';
// Booking
import 'package:cure_team_2/features/bookingAppointment/screens/Payment_Method.dart';
import 'package:cure_team_2/features/bookingAppointment/screens/bookingAppointment.dart';
import 'package:cure_team_2/features/bookingAppointment/screens/your_appointment.dart';
import 'package:cure_team_2/features/chat/presentation/pages/chat_detail_screen.dart';
// Chat
import 'package:cure_team_2/features/chat/presentation/pages/chat_list_screen.dart';
// Auth & Profile

// Intro
import 'package:cure_team_2/features/intro/view/onboarding_screen.dart';
import 'package:cure_team_2/features/intro/view/splash_screen.dart';


// Notifications
import 'package:cure_team_2/features/notifications/presentation/pages/notification_screen.dart';
import 'package:cure_team_2/features/tabs/screens/booking.dart';
// Tabs

import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.chatList:
        return MaterialPageRoute(builder: (_) => const ChatListScreen());
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
      case Routes.paymentmethod:
        return MaterialPageRoute(builder: (_) => const PaymentMethod());

      case Routes.yourAppointment:
        return MaterialPageRoute(builder: (_) => const YourAppointment());
      case Routes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());

      default:
        return null;
    }
  }
}
