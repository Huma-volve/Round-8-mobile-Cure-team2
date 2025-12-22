import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorHeaderSection extends StatelessWidget {
  const DoctorHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 86,
          height: 86,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 43,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: SvgPicture.asset(
                    Assets.doctorVicica,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Center(
                    child: Image.asset(
                      Assets.checkdoctor,
                      width: 12,
                      height: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Jessica Turner',
                style: AppTextStyles.georgiaSubheading.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text(
                'Pulmonologist',
                style: AppTextStyles.montserratRegularSmallCaption.copyWith(
                  color: AppColors.grey700,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Image.asset(
                    Assets.location,
                    width: 14,
                    height: 14,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '129, El-Nasr Street, Cairo',
                      style: AppTextStyles.montserratRegularSmallCaption
                          .copyWith(
                        color: AppColors.grey700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 34,
          width: 34,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.grey200),
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.favourite,
              width: 18,
              height: 18,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
