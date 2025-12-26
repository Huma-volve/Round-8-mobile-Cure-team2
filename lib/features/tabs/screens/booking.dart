import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/tabs/widgets/bookingItem.dart';
import 'package:cure_team_2/features/tabs/widgets/bookingStatusEnum.dart';

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
            height: 80.h,
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

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      MyBookingItem(
                        onpressedButtonleft: () {},
                        onpressedButtonright: () {},
                        statusOntap: () {},
                        statusText: statusText(BookingStatus.Upcoming),
                        statuscolor: statusColor(BookingStatus.Upcoming),
                        TextButton1: BookingStatus.Upcoming.TextButton[0],
                        TextButton2: BookingStatus.Upcoming.TextButton[1],
                      ),
                      SizedBox(height: 16.h),
                      MyBookingItem(
                        onpressedButtonleft: () {},
                        onpressedButtonright: () {},
                        statusOntap: () {},
                        statusText: statusText(BookingStatus.Complete),
                        statuscolor: statusColor(BookingStatus.Complete),
                        TextButton1: BookingStatus.Complete.TextButton[0],
                        TextButton2: BookingStatus.Complete.TextButton[1],
                      ),
                      SizedBox(height: 16.h),
                      MyBookingItem(
                        onpressedButtonleft: () {},
                        onpressedButtonright: () {},
                        statusOntap: () {},
                        statusText: statusText(BookingStatus.Canceled),
                        statuscolor: statusColor(BookingStatus.Canceled),
                        TextButton1: BookingStatus.Canceled.TextButton[0],
                        TextButton2: BookingStatus.Canceled.TextButton[1],
                      ),
                      SizedBox(height: 16.h),
                      MyBookingItem(
                        onpressedButtonleft: () {},
                        onpressedButtonright: () {},
                        statusOntap: () {},
                        statusText: statusText(BookingStatus.Complete),
                        statuscolor: statusColor(BookingStatus.Complete),
                        TextButton1: BookingStatus.Complete.TextButton[0],
                        TextButton2: BookingStatus.Complete.TextButton[1],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
