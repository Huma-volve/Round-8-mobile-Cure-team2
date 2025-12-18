import 'package:cure_team_2/core/widgets/search_barr.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:cure_team_2/features/home/presentation/pages/doctors/presentation/pages/widget/custom_list_view_doctor_horizontal.dart';
import 'package:cure_team_2/features/home/presentation/pages/doctors/presentation/pages/widget/custom_list_view_doctor_vertical.dart';
import 'package:flutter/material.dart';

class DoctorsPageBody extends StatelessWidget {
  const DoctorsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            VSpace(30),
            CustomSearchPageBottom(),
            VSpace(24),
            CustomListViewDoctorHorizontal(),
            VSpace(24),
            CustomListViewDoctorVertical()
          ],
        ),
      ),
    );
  }
}
