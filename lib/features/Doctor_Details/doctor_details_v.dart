import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(
            Assets.arrow,
            width: 22,
            height: 22,
            fit: BoxFit.contain,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.chat,
              width: 22,
              height: 22,
              fit: BoxFit.contain,
            ),
          ),
        ],
        title: Text(
          'Doctor Details',
          style: AppTextStyles.georgiaSubheading.copyWith(fontSize: 20),
        ),
      ),
      body: const DoctorDetailsViewBody(),
    );
  }
}
