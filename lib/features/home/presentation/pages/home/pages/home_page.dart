import 'package:cure_team_2/features/chat/presentation/pages/chat_list_screen.dart';
import 'package:cure_team_2/features/home/presentation/pages/home/pages/widget/custom_bottom_navigation_bar.dart';
import 'package:cure_team_2/features/home/presentation/pages/home/pages/widget/home_page_body.dart';
import 'package:cure_team_2/features/profile/presentation/pages/profile_screen.dart';
import 'package:cure_team_2/features/tabs/screens/myBooking.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  final List<Widget> listPage = [
    const HomePageBody(),
    const Mybooking(),
    const ChatListScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return listPage[value];
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (index) {
          setState(() {
            currentIndex.value = index;
          });
        },
      ),
    );
  }
}
