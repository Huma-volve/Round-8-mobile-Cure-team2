import 'package:cure_team_2/features/profile/presentation/pages/widgets/date_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';

class BirthDateSection extends StatelessWidget {
  final int selectedDay;
  final String monthName;
  final int selectedYear;
  final VoidCallback onDayTap;
  final VoidCallback onMonthTap;
  final VoidCallback onYearTap;

  const BirthDateSection({
    super.key,
    required this.selectedDay,
    required this.monthName,
    required this.selectedYear,
    required this.onDayTap,
    required this.onMonthTap,
    required this.onYearTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your birthday',
          style: AppTextStyles.montserratButton.copyWith(
            color: const Color(0xFF05162C),
          ),
        ),
        12.verticalSpace,
        Row(
          children: [
            DateBox(label: '$selectedDay', onTap: onDayTap),
            const SizedBox(width: 12),
            DateBox(label: monthName, onTap: onMonthTap),
            const SizedBox(width: 12),
            DateBox(label: '$selectedYear', onTap: onYearTap),
          ],
        ),
      ],
    );
  }
}
