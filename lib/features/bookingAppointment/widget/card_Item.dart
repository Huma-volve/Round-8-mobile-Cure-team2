import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.text,
    required this.creditName,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final String creditName;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.all(2.h),
        height: 56.h,
        width: 396.w,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.success50 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.grey50),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            Image.asset(
              isSelected ? Assets.checksolid : Assets.checkempty,
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 5.w),
            Text(
              text,
              style: AppTextStyles.montserratButton.copyWith(
                color: isSelected ? AppColors.success : AppColors.secondary300,
              ),
            ),
            const Spacer(),
            Image.asset(creditName),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
