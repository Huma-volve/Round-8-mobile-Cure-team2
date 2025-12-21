import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorStatsSection extends StatelessWidget {
  const DoctorStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.profile,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '120',
                style: AppTextStyles.montserratCaption,
              ),
              Text(
                'Total',
                style: AppTextStyles.montserratRegularSmallCaption,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.experince,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '120',
                style: AppTextStyles.montserratCaption,
              ),
              Text(
                'Total',
                style: AppTextStyles.montserratRegularSmallCaption,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.rating,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '120',
                style: AppTextStyles.montserratCaption,
              ),
              Text(
                'Total',
                style: AppTextStyles.montserratRegularSmallCaption,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.review,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '120',
                style: AppTextStyles.montserratCaption,
              ),
              Text(
                'Total',
                style: AppTextStyles.montserratRegularSmallCaption,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
