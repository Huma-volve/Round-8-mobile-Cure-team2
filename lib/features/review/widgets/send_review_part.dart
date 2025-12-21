import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SendReviewPart extends StatelessWidget {
  const SendReviewPart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: AppColors.primary,
        ),
        onPressed: () {},
        child: Text(
          'Send your review',
          textAlign: TextAlign.center,
          style: AppTextStyles.montserratSubheading
              .copyWith(color: AppColors.grey100),
        ),
      ),
    );
  }
}
