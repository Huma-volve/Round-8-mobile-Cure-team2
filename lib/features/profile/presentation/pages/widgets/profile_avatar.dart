import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';

class ProfileAvatar extends StatelessWidget {
  final File? selectedImage;
  final String name;
  final String address;
  final VoidCallback onCameraTap;
  final VoidCallback onAddressTap;

  const ProfileAvatar({
    super.key,
    required this.selectedImage,
    required this.name,
    required this.address,
    required this.onCameraTap,
    required this.onAddressTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 48.r,
              backgroundImage: selectedImage != null
                  ? FileImage(selectedImage!)
                  : const AssetImage('assets/images/profile_img.jpg')
                      as ImageProvider,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: onCameraTap,
                child: Container(
                  width: 24.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [Color(0xFF145DB8), Color(0xFFFFFFFF)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      decoration: BoxDecoration(
                        color: const Color(0xE5FFFFFF),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 13,
                        color: Color(0xFF145DB8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        12.verticalSpace,
        Text(name, style: AppTextStyles.georgiaSubheading),
        4.verticalSpace,
        GestureDetector(
          onTap: onAddressTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Icon.png',
                width: 9.3.w,
                height: 13.5.h,
                fit: BoxFit.contain,
                color: const Color(0xFF6D7379),
              ),
              4.horizontalSpace,
              Text(address, style: AppTextStyles.montserratSmallCaption),
              4.horizontalSpace,
              Icon(
                Icons.keyboard_arrow_down,
                color: const Color(0xFF99a2ab),
                size: 20.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
