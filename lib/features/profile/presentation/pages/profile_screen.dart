import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/show_confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/profile_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              const ProfileHeader(),
              64.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset(
                  'assets/icons/notification.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF05162C),
                    BlendMode.srcIn,
                  ),
                ),
                title: 'Notification',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: const Color(0xFF4CAF50),
                  activeThumbColor: Colors.white,
                  trackOutlineColor: WidgetStateProperty.all(
                    const Color(0xFFC8E6C9),
                  ),
                ),
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset(
                  'assets/icons/Banknote 3.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                title: 'Payment Method',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                onTap: () {
                  Navigator.pushNamed(context, Routes.paymentMethod);
                },
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset(
                  'assets/icons/Heart.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF05162C),
                    BlendMode.srcIn,
                  ),
                ),
                title: 'Favorite',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                onTap: () {},
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset(
                  'assets/icons/Settings.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF05162C),
                    BlendMode.srcIn,
                  ),
                ),
                title: 'Settings',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                onTap: () {
                  Navigator.pushNamed(context, Routes.settings);
                },
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset(
                  'assets/icons/Chat Line.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF05162C),
                    BlendMode.srcIn,
                  ),
                ),
                title: 'FAQs',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                onTap: () {
                  Navigator.pushNamed(context, Routes.faqs);
                },
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset(
                  'assets/icons/Lock Keyhole Minimalistic.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF05162C),
                    BlendMode.srcIn,
                  ),
                ),
                title: 'Privacy Policy',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                onTap: () {
                  Navigator.pushNamed(context, Routes.privacyPolicy);
                },
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset(
                  'assets/icons/Logout 4.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFfc4b4e),
                    BlendMode.srcIn,
                  ),
                ),
                title: 'Log out',
                textStyle: const TextStyle(color: Color(0xFFfc4b4e)),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.3),
                    builder: (_) => ShowConfirmDialog(
                      title: 'Logout',
                      message: 'Are you sure you want to log out?',
                      confirmText: 'Yes, Logout',
                      onConfirm: () {
                        Navigator.pushNamed(context, Routes.splash);
                      },
                    ),
                  );
                },
                showArrow: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
