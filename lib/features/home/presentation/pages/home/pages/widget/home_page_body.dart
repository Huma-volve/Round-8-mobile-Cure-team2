import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/core/widgets/search_barr.dart';
import 'package:cure_team_2/features/home/presentation/pages/home/pages/widget/customImage.dart';
import 'package:cure_team_2/features/home/presentation/pages/home/pages/widget/custom_app_bar_home.dart';
import 'package:cure_team_2/features/home/presentation/pages/home/pages/widget/custom_list_view_home_horizontal.dart';
import 'package:cure_team_2/features/home/presentation/pages/home/pages/widget/custom_list_view_home_vertical.dart';
import 'package:cure_team_2/features/home/presentation/pages/home/pages/widget/custom_text.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBarHome(),
          const SizedBox(
            height: 24,
          ),
          const CustomSearchPageBottom(),
          const SizedBox(
            height: 24,
          ),
          CustomText(
            onTap: () => context.pushNamed(Routes.specialtiesPage),
            textLarge: 'Specialties',
            textSmall: 'View all',
          ),
          const SizedBox(
            height: 24,
          ),
          const CustomListViewHomeHorizontal(),
          const SizedBox(
            height: 24,
          ),
          const CustomImage(),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            onTap: () => context.pushNamed(Routes.doctorsPage),
            textLarge: 'Doctors near you',
            textSmall: 'View all',
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomListViewHomeVertical()
        ],
      ),
    );
  }
}
