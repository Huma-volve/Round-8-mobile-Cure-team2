import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mybooking extends StatefulWidget {
  const Mybooking({super.key});

  @override
  State<Mybooking> createState() => _MybookingState();
}

class _MybookingState extends State<Mybooking> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            height: 81.h,
            width: 428.w,
            margin: EdgeInsets.only(left: 24.w),
            child: Text('My Booking', style: AppTextStyles.georgiaSubheading),
          ),
          SizedBox(height: 10.h),
          EasyInfiniteDateTimeLine(
            dayProps: const EasyDayProps(width: 50, height: 60),
            onDateChange: (date) {
              setState(() {
                selectedDate = date;
              });
            },
            activeColor: AppColors.primary,
            showTimelineHeader: false,
            firstDate: DateTime.now().subtract(const Duration(days: 30)),
            lastDate: DateTime.now().add(const Duration(days: 360)),
            focusDate: selectedDate,
          ),
          SizedBox(height: 16.h),
          Container(
            alignment: Alignment.bottomLeft,
            height: 81.h,
            width: 428.w,
            margin: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Image.asset(Assets.bookingicon, width: 24.w, height: 24.h),
                    const SizedBox(width: 5),
                    Text(
                      'Monday, July 21 - 11:00 Am',
                      style: AppTextStyles.montserratButton,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Upcoming',
                        style: AppTextStyles.montserratCaption.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: bookings.length,
          //     itemBuilder: (context, index) {
          //       final booking = bookings[index];
          //       return BookingCard(booking: booking);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
