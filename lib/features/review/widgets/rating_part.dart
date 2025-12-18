import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingPart extends StatelessWidget {
  const RatingPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // يخليهم في منتصف العرض
        children: [
          Text(
            'Your Rate',
            style: AppTextStyles.georgiaH3,
          ),
          Row(
            children: [
              SvgPicture.asset(
                Assets.starReview,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              SvgPicture.asset(
                Assets.starReview,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              SvgPicture.asset(
                Assets.starReview,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              SvgPicture.asset(
                Assets.starReview,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              SvgPicture.asset(
                Assets.starReviewDisabled,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              Spacer(),
              Text(
                "4/5",
                style: AppTextStyles.georgiaH2,
              )
            ],
          )
        ],
      ),
    );
  }
}
