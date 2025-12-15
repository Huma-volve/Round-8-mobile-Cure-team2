import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_button.dart';
import 'package:cure_team_2/features/auth/presentation/widgets/otp_cold_down.dart';
import 'package:cure_team_2/features/auth/presentation/widgets/pin_code.dart';
import 'package:flutter/material.dart';

class OtpCodeVerification extends StatelessWidget {
  const OtpCodeVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Code Verification"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Code has been send to +02 010 *** **88",
            textAlign: TextAlign.center,
            style: AppTextStyles.montserratButton,
          ).appPaddingVr(72),
          const PinCode(),
          const OtpColdDown().appPaddingVr(24),
          const AppButton(text: "Verify")
        ],
      ).appPaddingHr(),
    );
  }
}
