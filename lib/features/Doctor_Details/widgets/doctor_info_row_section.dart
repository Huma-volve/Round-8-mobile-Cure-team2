import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/review/review_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorInfoRowSection extends StatelessWidget {
  const DoctorInfoRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Reviews and Rating',
            style: AppTextStyles.georgiaSubheading.copyWith(fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 6),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ReviewView()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.addreview,
                  width: 14,
                  height: 14,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 4),
                Text(
                  'add review',
                  style: AppTextStyles.montserratRegularCaption.copyWith(
                    fontSize: 13,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
