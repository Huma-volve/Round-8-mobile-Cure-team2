import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_details_view_body.dart';
import 'package:flutter/material.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: 60,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: SvgPicture.asset(
              Assets.chat,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 17, top: 10, bottom: 10),
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Doctor Details',
          style: AppTextStyles.georgiaH2.copyWith(fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const DoctorDetailsViewBody(),
    );
  }
}
