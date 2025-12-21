import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/Search_by_location_Doctor/widgets/search_by_location_doctor_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchByLocationDoctorView extends StatelessWidget {
  const SearchByLocationDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Your location',
              style: AppTextStyles.georgiaH3,
            ),
            Text(
              '129,El-Nasr Street',
              style: AppTextStyles.montserratRegularSubheading,
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SvgPicture.asset(
            Assets.arrow,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: const SearchByLocationDoctorBody(),
    );
  }
}
