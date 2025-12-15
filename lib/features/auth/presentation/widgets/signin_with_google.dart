import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton.icon(
        borderColor: AppColors.grey,
        text: "Sign in with Google",
        onPressed: () {},
        style:
            AppTextStyles.montserratButton.copyWith(color: AppColors.grey),
        color: Colors.transparent,
        icon: SvgPicture.asset(Assets.googleIcon));
  }
}
