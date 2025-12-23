import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorStatsSection extends StatelessWidget {
  const DoctorStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.profile,
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 6),
              Text(
                '120',
                style: AppTextStyles.montserratCaption.copyWith(fontSize: 15),
              ),
              Text(
                'patients',
                style: AppTextStyles.montserratRegularSmallCaption.copyWith(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.experince,
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 6),
              Text(
                '120',
                style: AppTextStyles.montserratCaption.copyWith(fontSize: 15),
              ),
              Text(
                'experience',
                style: AppTextStyles.montserratRegularSmallCaption.copyWith(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.rating,
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10),
              Text(
                '120',
                style: AppTextStyles.montserratCaption.copyWith(fontSize: 15),
              ),
              SizedBox(height: 4),
              Text(
                'rating',
                style: AppTextStyles.montserratRegularSmallCaption.copyWith(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.review,
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 6),
              Text(
                '120',
                style: AppTextStyles.montserratCaption.copyWith(fontSize: 15),
              ),
              Text(
                'reviews',
                style: AppTextStyles.montserratRegularSmallCaption.copyWith(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
