import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';

class EditProfileButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool showPlus;

  const EditProfileButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.showPlus = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF145db8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.r),
          ),
        ),
        onPressed: onPressed,
        child: showPlus
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    padding: const EdgeInsets.all(5),
                    child: const Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: AppTextStyles.montserratButton.copyWith(
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: AppTextStyles.montserratButton.copyWith(
                  color: const Color(0xFFFFFFFF),
                ),
              ),
      ),
    );
  }
}
