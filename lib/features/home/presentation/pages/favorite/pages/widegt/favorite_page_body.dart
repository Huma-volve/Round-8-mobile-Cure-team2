import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

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
            Assets.bannerFavorite,
            width: MediaQuery.of(context).size.width * 0.5,
            fit: BoxFit.contain,
          ),
          const VSpace(24),
          const Text(
            'Your favorite!',
            style: TextStyle(fontSize: 24, color: Color(0xFF000000)),
          ),
          const VSpace(10),
          const Text(
            'Add your favorite to find it easily',
            style: TextStyle(fontSize: 16, color: Color(0xFF6D7379)),
          ),
        ],
      ),
    ));
  }
}
