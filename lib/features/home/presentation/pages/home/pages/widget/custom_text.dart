import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String textLarge;
  final String textSmall;
  final void Function()? onTap;
  const CustomText({
    super.key,
    required this.textLarge,
    required this.textSmall,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              textLarge,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Text(textSmall,
                style:
                    const TextStyle(fontSize: 17, color: AppColors.primary600)),
          ],
        ),
      ),
    );
  }
}
