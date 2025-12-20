import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/Favourite/models/doctor_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorFavItem extends StatelessWidget {
  const DoctorFavItem({super.key, required this.model});
  final DoctorFavModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: 396.w,
      height: 86,
      padding: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(width: 1, color: AppColors.grey50),
      ),
      child: Row(
        children: [
          Image.asset(
            model.doctorImage,
            width: 89.w,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16.w),
          SizedBox(
            height: 86.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.doctorName,
                  style: AppTextStyles.georgiaButton.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      model.specialty,
                      style: AppTextStyles.montserratCaption.copyWith(
                        color: AppColors.secondary300,
                      ),
                    ),
                    Text(
                      model.address,
                      style: AppTextStyles.montserratCaption.copyWith(
                        color: AppColors.secondary300,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(Assets.Star, width: 20.w, height: 20.h),
                    SizedBox(width: 8.w),
                    Text(model.rating),
                    SizedBox(width: 20.w),
                    Image.asset(model.ClockIcon, width: 20.w, height: 20.h),
                    SizedBox(width: 10.w),
                    Text(
                      model.startTime,
                      style: AppTextStyles.montserratCaption,
                    ),
                    Text('-', style: AppTextStyles.montserratCaption),
                    SizedBox(width: 5.w),
                    Text(model.endTime, style: AppTextStyles.montserratCaption),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Image.asset(Assets.favIconSolid, width: 24.w, height: 24.h),
        ],
      ),
    );
  }
}
