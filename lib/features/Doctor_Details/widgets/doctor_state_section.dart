import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorStatsSection extends StatelessWidget {
  const DoctorStatsSection({super.key});

  static const _stats = <_DoctorStatData>[
    _DoctorStatData(icon: Assets.profile, value: '2,000+', label: 'patients'),
    _DoctorStatData(icon: Assets.experince, value: '10+', label: 'experience'),
    _DoctorStatData(icon: Assets.rating, value: '4.5', label: 'rating'),
    _DoctorStatData(icon: Assets.review, value: '1,872', label: 'reviews'),
  ];

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

class _DoctorStatData {
  const _DoctorStatData({
    required this.icon,
    required this.value,
    required this.label,
  });

  final String icon;
  final String value;
  final String label;
}
