import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_button.dart';
import 'package:cure_team_2/core/widgets/app_text_field.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:cure_team_2/features/auth/presentation/widgets/or_divider.dart';
import 'package:cure_team_2/features/auth/presentation/widgets/phone_number_field.dart';
import 'package:cure_team_2/features/auth/presentation/widgets/signin_with_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/validators.dart';
import '../widgets/remember_me.dart';
import '../widgets/toggle_login_signup.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const VSpace(24),
            SizedBox(
              height: 60.h,
              width: 60.w,
              child: SvgPicture.asset(
                Assets.logoBlue,
              ),
            ),
            Text(
              "Create New Account",
              textAlign: TextAlign.center,
              style: AppTextStyles.georgiaH2,
            ).appPaddingVr(),
            const VSpace(24),
            const AppTextField(
              hintText: "Full name",
              prefix: Icon(Icons.person),
            ),
            AppTextField(
              hintText: "Email",
              prefix: const Icon(Icons.email),
              validator: (val) => AppValidation.validateEmail(val),
            ).appPaddingVr(8),
            PhoneNumberField(controller: TextEditingController()),
            const RememberMe().appPaddingVr(),
            AppButton(
              text: "Sign up",
              onPressed: () => context.pushNamed(Routes.otp),
            ),
            const OrDivider(
              verticalPadding: 24,
            ),
            const SignInWithGoogle(),
            const ToggleLoginSignup(
              login: false,
            ).appPaddingVr()
          ],
        ).appPaddingHr(),
      ),
    );
  }
}
