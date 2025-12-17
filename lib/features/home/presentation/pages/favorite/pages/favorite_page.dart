import 'package:cure_team_2/core/widgets/app_bar.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Your Favorite',
      ),
      body: FavoritePageBody(),
    );
  }
}

/// ================= AppBar =================

/// ================= Body =================
class FavoritePageBody extends StatelessWidget {
  const FavoritePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/baner_favorit.png',
            width: MediaQuery.of(context).size.width * 0.5,
            fit: BoxFit.contain,
          ),
          const VSpace(24),
          const Text('Your favorite!'),
          const VSpace(10),
          const Text('Add your favorite to find it easily'),
        ],
      ),
    ));
  }
}
