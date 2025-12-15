import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  final double verticalPadding;
  const OrDivider({super.key, this.verticalPadding = 16});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(
          color: AppColors.grey300,
        )),
        Text(
          "or",
          style: AppTextStyles.montserratButton.copyWith(
            color: AppColors.grey400,
          ),
        ).appPaddingHr(8),
        const Expanded(child: Divider(
          color: AppColors.grey300,
        ))
      ],
    ).appPaddingVr(verticalPadding);
  }
}
