import 'package:cure_team_2/core/widgets/app_bar.dart';
import 'package:cure_team_2/features/home/presentation/pages/favorite/pages/widegt/favorite_page_body.dart';
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
