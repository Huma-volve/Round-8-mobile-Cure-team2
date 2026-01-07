import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_button.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCancelDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (_) => Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              height: 475.h,
              width: 341.w,
              padding: const EdgeInsets.only(
                top: 32,
                bottom: 32,
                left: 48,
                right: 48,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(48),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(Assets.warningImage, width: 131.w, height: 131.h),
                  HSpace(32),
                  Text(
                    'Warning!',
                    style: AppTextStyles.georgiaSubheading.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.warning,
                    ),
                  ),
                  HSpace(32),
                  Text(
                    'Cancellation must be made at least\n 24 hours in advance to receive a\n refund!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.georgiaCaption.copyWith(
                      color: AppColors.secondary300,
                    ),
                  ),
                  HSpace(35),
                  Text(
                    'Are you sure?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.georgiaCaption.copyWith(
                      color: AppColors.secondary300,
                    ),
                  ),

                  HSpace(13),
                  AppButton(
                    text: 'Yes, Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.black,
                    width: 245.w,
                    height: 45.h,
                    borderRadius: 50.r,
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
