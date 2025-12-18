import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorInfoRow extends StatelessWidget {
  const DoctorInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.starsView,
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 4),
        Text(
          '4.8',
          style: AppTextStyles.montserratSubheading,
        ),
        SizedBox(width: 10),
        SvgPicture.asset(
          Assets.clock,
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 4),
        Text(
          '9:30am - 8:00pm',
          style: AppTextStyles.montserratSubheading,
        ),
      ],
    );
  }
}
