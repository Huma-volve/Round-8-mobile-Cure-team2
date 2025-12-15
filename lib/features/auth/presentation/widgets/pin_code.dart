import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/theme/app_colors.dart';

class PinCode extends StatelessWidget {
  const PinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      mainAxisAlignment: MainAxisAlignment.center,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      appContext: context,
      length: 4,
      obscureText: false,

      textStyle: AppTextStyles.montserratRegularH2,
      separatorBuilder: (context, position) => const HSpace(16),
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        inactiveFillColor: AppColors.grey50,
        inactiveColor: AppColors.grey50,

        shape: PinCodeFieldShape.box,
        activeColor: AppColors.primary,
        activeFillColor: AppColors.primary50,
        selectedColor: AppColors.primary,
        selectedFillColor: AppColors.primary50,

        borderRadius: BorderRadius.circular(4.r),
        fieldHeight: 63.h,
        fieldWidth: 62.w,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
    );
  }
}
