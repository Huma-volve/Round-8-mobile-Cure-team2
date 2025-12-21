import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              Assets.chat,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SvgPicture.asset(
            Assets.arrow,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
        title: Text('Doctor Details', style: AppTextStyles.georgiaH2),
      ),
      body: const DoctorDetailsViewBody(),
    );
  }
}
