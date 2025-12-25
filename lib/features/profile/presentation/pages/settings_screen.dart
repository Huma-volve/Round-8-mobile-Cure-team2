import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/profile_tile.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/show_confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          "Settings",
          style: TextStyle(
            fontFamily: AppTextStyles.georgiaH3.fontFamily,
            fontSize: AppTextStyles.georgiaH3.fontSize,
            fontWeight: AppTextStyles.georgiaH3.fontWeight,
            color: const Color(0xff000000),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8).r,
        child: Column(
          children: [
            81.verticalSpace,
            ProfileTile(
              leading: SvgPicture.asset(
                'assets/icons/Key Square 2.svg',
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  Color(0xff05162c),
                  BlendMode.srcIn,
                ),
              ),
              title: 'Password Management',
              textStyle: TextStyle(
                fontFamily: AppTextStyles.montserratButton.fontFamily,
                fontSize: AppTextStyles.montserratButton.fontSize,
                fontWeight: AppTextStyles.montserratButton.fontWeight,
                color: const Color(0xff05162c),
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.passwordManagement);
              },
            ),
            const SizedBox(height: 32),
            ProfileTile(
              leading: SvgPicture.asset(
                'assets/icons/User Rounded.svg',
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  Color(0xff05162c),
                  BlendMode.srcIn,
                ),
              ),
              title: 'Delete Account',
              showArrow: false,
              textStyle: TextStyle(
                fontFamily: AppTextStyles.montserratButton.fontFamily,
                fontSize: AppTextStyles.montserratButton.fontSize,
                fontWeight: AppTextStyles.montserratButton.fontWeight,
                color: const Color(0xff05162c),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierColor: Colors.black.withOpacity(0.3),
                  builder: (_) => ShowConfirmDialog(
                    title: 'Delete account',
                    message: 'Are you sure you want to delete your account?',
                    confirmText: 'Yes, delete',
                    onConfirm: () {
                      Navigator.pushNamed(context, Routes.splash);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
