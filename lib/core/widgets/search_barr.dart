import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchPageBottom extends StatelessWidget {
  const CustomSearchPageBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.searchPage),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.secondary50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.asset(Assets.searchIcon),
              const SizedBox(width: 8),
              const Expanded(
                  child: Text(
                'Search for specialty, doctor',
                style: TextStyle(fontSize: 16, color: Color(0xFF6D7379)),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
