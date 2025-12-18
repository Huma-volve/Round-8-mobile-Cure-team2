import 'package:flutter/material.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/logout_tile.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/profile_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                leading: SvgPicture.asset('assets/icons/bell.svg'),
                title: 'Notification',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                  activeTrackColor: Colors.green,
                ),
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset('assets/icons/Banknote 3.svg'),
                title: 'Payment Method',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                onTap: () {},
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset('assets/icons/Heart.svg'),
                title: 'Favorite',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                onTap: () {},
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset('assets/icons/Settings.svg'),
                title: 'Settings',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                onTap: () {},
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset('assets/icons/Chat Line.svg'),
                title: 'FAQs',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                onTap: () {},
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset(
                  'assets/icons/Lock Keyhole Minimalistic.svg',
                ),
                title: 'Privacy Policy',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                onTap: () {},
              ),
              24.verticalSpace,
              ProfileTile(
                leading: SvgPicture.asset('assets/icons/Logout 4.svg'),
                title: 'Log out',
                textStyle: const TextStyle(color: Color(0xFF05162C)),
                onTap: () => showLogoutDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
