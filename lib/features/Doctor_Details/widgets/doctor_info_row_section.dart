import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorInfoRowSection extends StatelessWidget {
  const DoctorInfoRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.review);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Reviews and Rating',
              style: AppTextStyles.georgiaSubheading.copyWith(fontSize: 23),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 6),
          Row(
            children: [
              SvgPicture.asset(
                Assets.addreview,
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 4),
              Text(
                'add review',
                style: AppTextStyles.montserratRegularSubheading.copyWith(
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
