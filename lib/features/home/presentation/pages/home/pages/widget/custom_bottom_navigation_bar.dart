import 'package:cure_team_2/core/constants/assets.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color(0xFF145DB8),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(Assets.homeIcon), label: 'Home'),
        BottomNavigationBarItem(
            icon: Image.asset(Assets.calendarIcon), label: 'Booking'),
        BottomNavigationBarItem(
            icon: Image.asset(Assets.chatIcon), label: 'Chat'),
        BottomNavigationBarItem(
            icon: Image.asset(Assets.profileIcon), label: 'Profile'),
      ],
    );
  }
}
