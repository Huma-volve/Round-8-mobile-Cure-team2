import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/tabs/widgets/myBookingItem.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: 16.h),
            Container(
              alignment: Alignment.bottomLeft,

              width: 428.w,
              margin: EdgeInsets.only(left: 16.w, right: 18.w),
              child: Column(
                children: [
                  myBookingItem(statusOntap: () {}, statusText: 'Upcoming'),
                  SizedBox(height: 16.h),
                  myBookingItem(statusOntap: () {}, statusText: 'Completed'),
                  SizedBox(height: 16.h),
                  myBookingItem(statusOntap: () {}, statusText: 'Canceled'),
                  SizedBox(height: 16.h),
                  myBookingItem(statusOntap: () {}, statusText: 'Upcoming'),
                  SizedBox(height: 16.h),
                  myBookingItem(statusOntap: () {}, statusText: 'Completed'),
                  SizedBox(height: 16.h),
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
      ),
    );
  }
}

// enum BookingStatus { upcoming, completed, canceled }
// Color get statusColor {
//   switch (booking.status) {
//     case BookingStatus.upcoming:
//       return AppColors.primary;
//     case BookingStatus.completed:
//       return AppColors.success;
//     case BookingStatus.canceled:
//       return AppColors.error;
//   }
// }

// String get statusText {
//   switch (booking.status) {
//     case BookingStatus.upcoming:
//       return 'Upcoming';
//     case BookingStatus.completed:
//       return 'Completed';
//     case BookingStatus.canceled:
//       return 'Canceled';
//   }
// }
