import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class LogoutTile extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutTile({super.key, required this.onTap, required Icon leading});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
        leading: const Icon(IconlyLight.logout, color: Colors.red),
        title: Text(
          'Log out',
          style: AppTextStyles.montserratRegularButton.copyWith(
            color: Colors.red,
            height: 1.0,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

void showLogoutDialog(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final dialogWidth = screenWidth > 428 ? 428.0 : screenWidth - 32;

  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: dialogWidth,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
              bottomLeft: Radius.circular(54),
              bottomRight: Radius.circular(54),
            ),
            boxShadow: [BoxShadow(color: Color(0x40000000), blurRadius: 4)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Logout',
                style: TextStyle(
                  fontFamily: AppTextStyles.georgiaH3.fontFamily,
                  fontSize: AppTextStyles.georgiaH3.fontSize,
                  fontWeight: AppTextStyles.georgiaH3.fontWeight,
                  color: const Color(0xFF05162C),
                ),
              ),

              const SizedBox(height: 16),
              const Divider(height: 1, color: Color(0xFFe5e7eb)),
              const SizedBox(height: 16),

              Text(
                'Are you sure you want to log out?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTextStyles.montserratButton.fontFamily,
                  fontSize: AppTextStyles.montserratButton.fontSize,
                  fontWeight: AppTextStyles.montserratButton.fontWeight,
                  color: const Color(0xFF6D7379),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 37,
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFBBC1C7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontFamily:
                                AppTextStyles.montserratCaption.fontFamily,
                            fontSize: AppTextStyles.montserratCaption.fontSize,
                            fontWeight:
                                AppTextStyles.montserratCaption.fontWeight,
                            color: const Color(0xFF05162C),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.splash);
                      },
                      child: Container(
                        height: 37,
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF145DB8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Yes, Logout',
                          style: TextStyle(
                            fontFamily:
                                AppTextStyles.montserratCaption.fontFamily,
                            fontSize: AppTextStyles.montserratCaption.fontSize,
                            fontWeight:
                                AppTextStyles.montserratCaption.fontWeight,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
