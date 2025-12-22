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
      children: _stats
          .map((stat) => Expanded(child: _DoctorStatItem(data: stat)))
          .toList(),
    );
  }
}

class _DoctorStatItem extends StatelessWidget {
  const _DoctorStatItem({required this.data});

  final _DoctorStatData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          data.icon,
          width: 22,
          height: 22,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 3),
        Text(
          data.value,
          style: AppTextStyles.montserratCaption.copyWith(
            fontSize: 14,
            color: AppColors.secondary900,
          ),
        ),
        Text(
          data.label,
          style: AppTextStyles.montserratRegularSmallCaption.copyWith(
            fontSize: 11,
            color: AppColors.grey700,
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
