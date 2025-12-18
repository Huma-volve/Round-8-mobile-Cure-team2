import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();
  // ==================== GEORGIA ====================
  static const String _georgia = 'Georgia';
  static TextStyle georgiaH1 = TextStyle(
    fontFamily: _georgia,
    fontSize: 40.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle georgiaH2 = TextStyle(
    fontFamily: _georgia,
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle georgiaH3 = TextStyle(
    fontFamily: _georgia,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle georgiaSubheading = TextStyle(
    fontFamily: _georgia,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle georgiaButton = TextStyle(
    fontFamily: _georgia,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle georgiaCaption = TextStyle(
    fontFamily: _georgia,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle georgiaSmallCaption = TextStyle(
    fontFamily: _georgia,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  // ==================== MONTSERRAT ====================

  static const String _montserrat = 'Montserrat';

  static TextStyle montserratRegularH1 = TextStyle(
    fontFamily: _montserrat,
    fontSize: 40.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle montserratRegularH2 = TextStyle(
    fontFamily: _montserrat,
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle montserratRegularH3 = TextStyle(
    fontFamily: _montserrat,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle montserratRegularSubheading = TextStyle(
    fontFamily: _montserrat,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle montserratRegularButton = TextStyle(
    fontFamily: _montserrat,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle montserratRegularCaption = TextStyle(
    fontFamily: _montserrat,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle montserratRegularSmallCaption = TextStyle(
    fontFamily: _montserrat,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle montserratH1 = TextStyle(
    fontFamily: _montserrat,
    fontSize: 40.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle montserratH2 = TextStyle(
    fontFamily: _montserrat,
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle montserratH3 = TextStyle(
    fontFamily: _montserrat,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle montserratSubheading = TextStyle(
    fontFamily: _montserrat,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle montserratButton = TextStyle(
    fontFamily: _montserrat,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle montserratCaption = TextStyle(
    fontFamily: _montserrat,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle montserratSmallCaption = TextStyle(
    fontFamily: _montserrat,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
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

class FontWeightHelper {
  const FontWeightHelper._();
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

