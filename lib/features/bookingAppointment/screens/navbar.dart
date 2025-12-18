import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/features/tabs/screens/chat.dart';
import 'package:cure_team_2/features/tabs/screens/home.dart';
import 'package:cure_team_2/features/tabs/screens/myBooking.dart';
import 'package:cure_team_2/features/tabs/screens/profile.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<Widget> tabs = [Home(), Mybooking(), Chat(), Profile()];
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.homeicon)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.bookingicon)),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.chaticon)),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.profileicon)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
