import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorInfoRowSection extends StatelessWidget {
  const DoctorInfoRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Reviews and Rating',
          style: AppTextStyles.georgiaSubheading.copyWith(fontSize: 40),
        ),
        Spacer(),
        Row(
          children: [
            SvgPicture.asset(
              Assets.addreview,
              width: 17,
              height: 17,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'add review',
              style: AppTextStyles.montserratRegularSubheading
                  .copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ],
    );
  }
}
