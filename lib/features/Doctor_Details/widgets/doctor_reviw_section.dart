import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorReviewsSection extends StatelessWidget {
  const DoctorReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: AppColors.grey200),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.grey200),
                ),
                child: ClipOval(
                  child: SvgPicture.asset(
                    Assets.nabilaReyna,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nabila Reyna',
                      style: AppTextStyles.georgiaSubheading.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '30 min ago',
                      style: AppTextStyles.montserratSubheading.copyWith(
                        fontSize: 12,
                        color: AppColors.grey700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25,
                width: 60,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: AppColors.warning50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.starReview,
                      width: 16,
                      height: 16,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '4.5',
                      style: AppTextStyles.montserratSubheading.copyWith(
                        fontSize: 12,
                        color: AppColors.secondary900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Excellent service! Dr. Jessica Turner was attentive and thorough. The clinic was clean, and the staff were friendly. Highly recommend for in-person care!',
            style: AppTextStyles.montserratRegularCaption.copyWith(
              fontSize: 13,
              color: AppColors.grey700,
            ),
          ),
        ],
      ),
    );
  }
}
