import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorRatingSection extends StatelessWidget {
  const DoctorRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '4.5/5',
          style: AppTextStyles.georgiaSubheading.copyWith(fontSize: 40),
        ),
        Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.starReview,
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
                SvgPicture.asset(
                  Assets.starReview,
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
                SvgPicture.asset(
                  Assets.starReview,
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
                SvgPicture.asset(
                  Assets.starReview,
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
                SvgPicture.asset(
                  Assets.starReviewDisabled,
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              '1250+ Reviews',
              style: AppTextStyles.montserratRegularH3.copyWith(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
