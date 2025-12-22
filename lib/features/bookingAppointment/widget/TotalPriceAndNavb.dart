import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceAndNavBar extends StatelessWidget {
  const TotalPriceAndNavBar({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5.w, color: AppColors.grey50),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Price ', style: AppTextStyles.montserratH3),
                    TextSpan(text: '/ ', style: AppTextStyles.georgiaCaption),
                    TextSpan(
                      text: 'hour',
                      style: AppTextStyles.georgiaCaption.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '350 ',
                      style: AppTextStyles.montserratRegularButton.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                    TextSpan(
                      text: '\$',
                      style: AppTextStyles.montserratRegularButton.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          AppButton(
            onPressed: onPressed,
            text: text,
            style: AppTextStyles.montserratButton.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
