import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8).r,
      decoration: BoxDecoration(
        color: const Color(0xFFf5f6f7),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundImage: const AssetImage(
              'assets/images/profile_image.jpg',
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Seif Mohamed',
                      style: AppTextStyles.georgiaSubheading,
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/Icon.png',
                      width: 9.3.w,
                      height: 13.5.h,
                      fit: BoxFit.contain,
                      color: const Color(0xFF6D7379),
                    ),
                    6.horizontalSpace,
                    Text(
                      '129 El-Nasr Street, Cairo',
                      style: AppTextStyles.montserratSmallCaption,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xFF99a2ab),
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.editProfile);
            },
          ),
        ],
      ),
    );
  }
}
