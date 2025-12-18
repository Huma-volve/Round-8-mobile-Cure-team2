import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyNotificationWidget extends StatelessWidget {
  const EmptyNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Placeholder for illustration - using an Icon + Decoration for now as per screenshot vibe
          Container(
            width: 150.w,
            height: 150.w,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            // In a real app we'd use SvgPicture.asset('assets/images/empty_notification.svg')
            child: Icon(
              Icons.notifications_off_outlined,
              size: 80.sp,
              color: AppColors.secondaryText,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            "Nothing to display here!",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
              fontFamily: 'Montserrat', // Adjust if needed
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "We'll notify you once we have new notifications.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
