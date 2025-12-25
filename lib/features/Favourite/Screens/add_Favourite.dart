import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/bookingAppointment/widget/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFavourite extends StatelessWidget {
  const AddFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Your Favorite"),
      body: Container(
        // width: 256.w,
        // height: 262.h,
        margin: const EdgeInsets.all(24),
        padding: EdgeInsets.only(left: 60.w, right: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.favouritImage, width: 177.5.w, height: 181.h),
            SizedBox(height: 24.h),
            Text('Your favorite!', style: AppTextStyles.georgiaH3),
            SizedBox(height: 10.h),
            Text(
              'Add your favorite to find it easily',
              style: AppTextStyles.montserratRegularButton,
            ),
          ],
        ),
      ),
    );
  }
}
