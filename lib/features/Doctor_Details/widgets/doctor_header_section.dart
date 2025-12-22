import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorHeaderSection extends StatelessWidget {
  const DoctorHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 43,

          child: ClipOval(
            child: SvgPicture.asset(Assets.review, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dr. Jessica Turner', style: AppTextStyles.georgiaCaption),
            Text(
              'Pulmonologist',
              style: AppTextStyles.montserratRegularSmallCaption,
            ),
            Text(
              '129,El-Nasr Street, Cairo ',
              style: AppTextStyles.montserratRegularSmallCaption,
            ),
          ],
        ),
        SizedBox(width: 10),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.favouritImage,
              width: 16,
              height: 16,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
