import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/features/Search_by_location_Doctor/widgets/doctor_image.dart';
import 'package:cure_team_2/features/Search_by_location_Doctor/widgets/doctor_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorCardSection extends StatelessWidget {
  const DoctorCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const DoctorImage(), // الصورة ملاصقة للشمال
          const SizedBox(width: 12), // مسافة بين الصورة وDoctorInfo
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(children: [
                const Expanded(child: DoctorInfo()),
                const SizedBox(width: 12),
                SvgPicture.asset(
                  Assets.favourite,
                  width: 17,
                  height: 17,
                  fit: BoxFit.contain,
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
