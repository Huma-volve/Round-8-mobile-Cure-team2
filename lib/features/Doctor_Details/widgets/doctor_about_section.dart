import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class DoctorAboutSection extends StatelessWidget {
  const DoctorAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About me',
          style: AppTextStyles.georgiaSubheading.copyWith(fontSize: 22),
        ),
        const SizedBox(height: 6),
        RichText(
          text: TextSpan(
            style: AppTextStyles.montserratRegularCaption.copyWith(
              fontSize: 14,
              color: AppColors.grey700,
            ),
            children: [
              const TextSpan(
                text:
                    'Dr. Jessica Turner, a board-certified Pulmonologist with over 8 years of experience in diagnosing and treating a wide range of respiratory conditions. ',
              ),
              TextSpan(
                text: 'Read more',
                style: AppTextStyles.montserratRegularCaption.copyWith(
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
