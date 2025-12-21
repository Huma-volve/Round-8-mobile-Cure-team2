import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/Search_by_location_Doctor/widgets/doctor_info_row.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Robert Johnson',
          style: AppTextStyles.georgiaSubheading,
        ),
        const SizedBox(height: 4),
        Text(
          'Orthopedic | El-Nasr Hospital',
          style: AppTextStyles.montserratRegularButton,
        ),
        const SizedBox(height: 8),
        const DoctorInfoRow(),
      ],
    );
  }
}
