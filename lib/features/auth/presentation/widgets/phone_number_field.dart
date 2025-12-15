import 'package:cure_team_2/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_text_field.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  const PhoneNumberField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      keyboardType: TextInputType.phone,
      validator: (val) => AppValidation.validateNumber(val),
      controller: controller,
      formatter: [FilteringTextInputFormatter.digitsOnly],
      hintText: "Enter your number",
      prefix: _buildCountryPicker(),
    );
  }


  Widget _buildCountryPicker() => CountryCodePicker(
        hideMainText: true,
        margin: EdgeInsets.zero,
        showDropDownButton: true,
        padding: EdgeInsets.zero,
        initialSelection: "EG",
        showFlagMain: true,
        flagWidth: 24.w,
        dialogTextStyle: AppTextStyles.montserratButton.copyWith(color: Colors.white),
        headerTextStyle: AppTextStyles.montserratButton.copyWith(color: Colors.white),
        dialogBackgroundColor: AppColors.primary,
        pickerStyle: PickerStyle.bottomSheet,
        flagDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
        ),
      );
}
