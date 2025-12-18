import 'package:cure_team_2/features/profile/presentation/pages/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            const _ProfileAvatar(),
            24.verticalSpace,
            ProfileTile(
              leading: const Icon(
                Icons.person_rounded,
                color: Color(0xFF99A2AB),
              ),
              title: 'Seif Mohamed',
              textStyle: const TextStyle(color: Color(0xFF99A2AB)),
              showArrow: false,
              onTap: () {},
            ),
            ProfileTile(
              leading: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/email.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  const SizedBox(width: 2),
                ],
              ),
              title: 'Seifmohamed@gmail.com',
              textStyle: const TextStyle(color: Color(0xFF99A2AB)),
              showArrow: false,
              onTap: () {},
            ),
            ProfileTile(
              leading: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Flag.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                    color: Color(0xFF99A2AB),
                  ),
                ],
              ),
              title: '01********',
              textStyle: const TextStyle(color: Color(0xFF99A2AB)),
              showArrow: false,
              onTap: () {},
            ),
            24.verticalSpace,
            const _BirthDateSection(),
            60.verticalSpace,
            const _EditProfileButton(),
          ],
        ),
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 48.r,
              backgroundImage: const AssetImage('assets/images/pro_img.jpg'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
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
          ],
        ),
        12.verticalSpace,
        Text('Seif Mohamed', style: AppTextStyles.georgiaSubheading),
        4.verticalSpace,
        Row(
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
            Text(
              '129, El-Nasr Street, Cairo',
              style: AppTextStyles.montserratSmallCaption,
            ),
            4.horizontalSpace,
            Icon(
              Icons.keyboard_arrow_down,
              color: const Color(0xFF99a2ab),
              size: 20.sp,
            ),
          ],
        ),
      ],
    );
  }
}

class _BirthDateSection extends StatelessWidget {
  const _BirthDateSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your birthday',
          style: AppTextStyles.montserratButton.copyWith(
            color: const Color(0xFF05162C),
          ),
        ),
        12.verticalSpace,
        const Row(
          children: [
            _DateBox(label: '29'),
            SizedBox(width: 12),
            _DateBox(label: 'July'),
            SizedBox(width: 12),
            _DateBox(label: '2024'),
          ],
        ),
      ],
    );
  }
}

class _DateBox extends StatelessWidget {
  final String label;

  const _DateBox({required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
        height: 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6F7),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: AppTextStyles.montserratButton),
            4.horizontalSpace,
            const Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ),
    );
  }
}

class _EditProfileButton extends StatelessWidget {
  const _EditProfileButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF145db8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Edit Profile',
          style: AppTextStyles.montserratButton.copyWith(
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
