import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({super.key, required this.text, required this.assets});

  final String text;
  final String assets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 110,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assets,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: AppTextStyles.montserratRegularSubheading,
            ),
          ],
        ),
      ),
    );
  }
}
