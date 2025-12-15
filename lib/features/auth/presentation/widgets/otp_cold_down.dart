import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class OtpColdDown extends StatelessWidget {
  const OtpColdDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      style: AppTextStyles.montserratCaption,
      TextSpan(text: "Resend code in ", children: [
        TextSpan(
            text: "55",
            style: AppTextStyles.montserratCaption.copyWith(
              color: AppColors.primary,
            )),
        const TextSpan(text: " S")
      ]),
    );
  }
}
