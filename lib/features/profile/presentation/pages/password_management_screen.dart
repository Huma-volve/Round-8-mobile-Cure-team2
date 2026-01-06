import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/edit_profile_button.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordManagementScreen extends StatefulWidget {
  const PasswordManagementScreen({super.key});

  @override
  State<PasswordManagementScreen> createState() =>
      _PasswordManagementScreenState();
}

class _PasswordManagementScreenState extends State<PasswordManagementScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? currentPasswordError;
  String? newPasswordError;
  String? confirmPasswordError;

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? validateStrongPassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (password.length > 10) {
      return 'Password must be at most 10 characters';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  bool validateForm() {
    setState(() {
      currentPasswordError = currentPasswordController.text.isEmpty
          ? 'Current password is required'
          : null;
      newPasswordError = validateStrongPassword(newPasswordController.text);
      if (confirmPasswordController.text.isEmpty) {
        confirmPasswordError = 'Confirm password is required';
      } else if (confirmPasswordController.text != newPasswordController.text) {
        confirmPasswordError = 'Passwords do not match';
      } else {
        confirmPasswordError = null;
      }
    });

    return currentPasswordError == null &&
        newPasswordError == null &&
        confirmPasswordError == null;
  }

  void onChangePassword() {
    if (validateForm()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff05162c),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Password management",
          style: TextStyle(
            fontFamily: AppTextStyles.georgiaH3.fontFamily,
            fontSize: AppTextStyles.georgiaH3.fontSize,
            color: const Color(0xff000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.verticalSpace,
              PasswordFieldTile(
                label: "Current password",
                controller: currentPasswordController,
                errorText: currentPasswordError,
              ),
              53.verticalSpace,
              PasswordFieldTile(
                label: "New password",
                controller: newPasswordController,
                errorText: newPasswordError,
              ),
              40.verticalSpace,
              PasswordFieldTile(
                label: "Confirm new password",
                controller: confirmPasswordController,
                errorText: confirmPasswordError,
              ),
              250.verticalSpace,
              EditProfileButton(
                onPressed: onChangePassword,
                text: 'Change Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
