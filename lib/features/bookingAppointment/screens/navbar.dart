import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/features/tabs/screens/chat.dart';
import 'package:cure_team_2/features/tabs/screens/home.dart';
import 'package:cure_team_2/features/tabs/screens/profile.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<Widget> _tabs = [
    const Home(),
    const Chat(),
    const Profile(),
  ];
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
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
