import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_button.dart';
import 'package:cure_team_2/core/widgets/app_text_field.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/routing/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 211.h,
                  width: 250.w,
                  child: Image.asset(Assets.loginIllustration),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "Enter your phone number",
                    style: AppTextStyles.georgiaH3,
                  ),
                ),
                AppTextField(
                  controller: TextEditingController(),
                  hintText: "Phone Number",
                  keyboardType: TextInputType.phone,
                ),
                const VSpace(48),
                AppButton(
                  text: "Sign in with your Phone Number",
                  onPressed: () => context.pushNamed(Routes.otp),
                ),
                const VSpace(16),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("OR"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const VSpace(16),
                AppButton(
                  text: "Sign in with Google",
                  color: Colors.white,
                  borderColor: Colors.grey,
                  style: AppTextStyles.montserratButton.copyWith(
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                const VSpace(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to signup
                      },
                      child: const Text("Sign up"),
                    ),
                  ],
                ),
              ],
            ).appPaddingHr(),
      ),
    );
  }
}
