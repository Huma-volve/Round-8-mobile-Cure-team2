import 'package:cure_team_2/features/Favourite/Widgets/DoctorFavItem.dart';
import 'package:cure_team_2/features/Favourite/models/doctor_Model.dart';
import 'package:cure_team_2/features/bookingAppointment/widget/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourFavourite extends StatelessWidget {
  const YourFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: " Your Favorite"),
      body: Column(
        children: [
          SizedBox(height: 32.h),
          Expanded(
            child: ListView.separated(
              itemCount: bookings.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 16.h);
              },
              itemBuilder: (BuildContext context, int index) {
                return DoctorFavItem(model: bookings[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
