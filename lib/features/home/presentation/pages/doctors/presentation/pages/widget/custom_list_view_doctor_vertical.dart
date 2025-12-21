import 'package:cure_team_2/features/home/presentation/pages/home/pages/widget/custom_container.dart';
import 'package:flutter/material.dart';

class CustomListViewDoctorVertical extends StatelessWidget {
  const CustomListViewDoctorVertical({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: CustomContainer(
            textTitle: 'Robert Johnson',
            textSubTitle: 'Orthopedic | El-Nasr Hospital',
          ),
        );
      },
    );
  }
}
