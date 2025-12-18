import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  // ==================== GEORGIA ====================
  static const String _georgia = 'Georgian';

  static TextStyle georgiaH1 = TextStyle(
    fontFamily: _georgia,
    fontSize: 40.sp,
    fontWeight: FontWeight.w400,
  );

  // Chat Text Styles
  static TextStyle chatTitle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static TextStyle chatSubtitle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
  );

  static TextStyle chatTime = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
  );

  static TextStyle headerTitle = TextStyle(
    fontFamily: _georgia,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );
}
