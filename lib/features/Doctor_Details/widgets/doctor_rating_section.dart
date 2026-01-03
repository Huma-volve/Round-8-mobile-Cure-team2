import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorRatingSection extends StatelessWidget {
  const DoctorRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    const filledStars = 4;
    const totalStars = 5;
    const starSize = 14.0;

    final stars = List<Widget>.generate(totalStars, (index) {
      final asset =
          index < filledStars ? Assets.starReview : Assets.starReviewDisabled;
      return SvgPicture.asset(
        asset,
        width: starSize,
        height: starSize,
        fit: BoxFit.contain,
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '4.5/5',
          style: AppTextStyles.georgiaSubheading.copyWith(fontSize: 36),
        ),
        Column(
          children: [
            Row(children: stars),
            const SizedBox(height: 6),
            Text(
              '1250+ Reviews',
              style: AppTextStyles.montserratRegularCaption.copyWith(
                fontSize: 13,
                color: AppColors.grey700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
