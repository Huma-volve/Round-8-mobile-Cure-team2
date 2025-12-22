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
          style: AppTextStyles.georgiaSubheading.copyWith(fontSize: 26),
        ),
        Text(
          'Dr. Jessica Turner, a board-certified Pulmonologist with over 8 years of experience in diagnosing and treating a wide range of respiratory and ',
          style: AppTextStyles.montserratRegularCaption.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
