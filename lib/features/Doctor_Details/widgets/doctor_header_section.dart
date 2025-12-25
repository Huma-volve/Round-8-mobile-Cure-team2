import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorHeaderSection extends StatelessWidget {
  const DoctorHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 46,

              child: CircleAvatar(
                radius: 38,
                child: ClipOval(
                  child: SvgPicture.asset(
                    Assets.review,
                    fit: BoxFit.cover,
                    width: 76,
                    height: 76,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.authentication,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Jessica Turner',
                style: AppTextStyles.georgiaCaption.copyWith(fontSize: 25),
              ),
              Text(
                'Pulmonologist',
                style: AppTextStyles.montserratRegularSmallCaption.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                '129,El-Nasr Street, Cairo ',
                style: AppTextStyles.montserratRegularSmallCaption.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.favourite,
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
