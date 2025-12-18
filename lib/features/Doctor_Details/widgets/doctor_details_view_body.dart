import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_about_section.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_header_section.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_info_row_section.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_rating_section.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_reviw_section.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_state_section.dart';
import 'package:flutter/material.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: DoctorHeaderSection(),
          ),
          SizedBox(height: 20),
          DoctorStatsSection(),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: DoctorAboutSection(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: DoctorInfoRowSection(),
          ),
          SizedBox(height: 20),
          DoctorRatingSection(),
          SizedBox(height: 20),
          DoctorReviewsSection(),
        ],
      ),
    );
  }
}
