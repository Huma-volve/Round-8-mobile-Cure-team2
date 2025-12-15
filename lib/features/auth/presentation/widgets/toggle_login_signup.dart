import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_click.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';

class ToggleLoginSignup extends StatelessWidget {
  final bool login;
  const ToggleLoginSignup({super.key, this.login = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don’t have an account?" : "Already have an account!",
          style: AppTextStyles.montserratSmallCaption
              .copyWith(color: AppColors.grey),
        ),
        const HSpace(8),
        AppClick(
          onTap: () => context.pushNamed(login ? Routes.signup : Routes.login),
          child: Text(
            login ? "Sign up" : "Sign in",
            style: AppTextStyles.montserratSmallCaption
                .copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
