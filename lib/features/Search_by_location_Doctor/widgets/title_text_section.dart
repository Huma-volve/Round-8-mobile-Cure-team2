import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TitleTextSection extends StatelessWidget {
  const TitleTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '24 Results ',
      style: AppTextStyles.georgiaH2.copyWith(color: AppColors.primary600),
    );
  }
}
