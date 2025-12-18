import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_button.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:cure_team_2/features/auth/presentation/widgets/phone_number_field.dart';
import 'package:cure_team_2/features/auth/presentation/widgets/signin_with_google.dart';
import 'package:cure_team_2/features/auth/presentation/widgets/toggle_login_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/or_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
              height: 211.h,
              width: 250.w,
              child: Image.asset(
                Assets.loginIllustration,
              )),
          Text(
            "Enter your phone number",
            style: AppTextStyles.georgiaH3,
          ).appPaddingVr(24),
          PhoneNumberField(
            controller: TextEditingController(),
          ),
          const VSpace(48),
          AppButton(
            text: "Sign in with your Phone Number",
            onPressed: () => context.pushNamed(Routes.otp),
          ),
          const VSpace(16),
          const OrDivider(),
          const SignInWithGoogle(),
          const ToggleLoginSignup().appPaddingVr(24)
        ]).appPaddingHr(),
      ),
    );
  }
}
