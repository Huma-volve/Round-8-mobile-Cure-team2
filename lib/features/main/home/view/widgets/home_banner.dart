import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_cached_network_image.dart';
import '../../../../../core/widgets/spacing.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          height: 188.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(24.r)),
        ),
        SvgPicture.asset(Assets.bannerBackground),
        SizedBox(
          height: 188.h,
          width: double.infinity,
          child: Row(
            children: [
              _content(),
              AppCachedNetworkImage(
                'https://pngimg.com/uploads/doctor/doctor_PNG16041.png',
                fit: BoxFit.cover,
                width: 180.w,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _content() => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Trusted doctor on your schedule😉 ",
              style: AppTextStyles.montserratRegularSmallCaption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeightHelper.medium,
                  fontSize: 9.sp),
            ),
            Text(
              "Consult a doctor\n— book today!",
              textAlign: TextAlign.center,
              style: AppTextStyles.montserratSubheading.copyWith(
                  color: Colors.white, fontWeight: FontWeightHelper.bold),
            ),
            const Spacer(),
            const _HappyPatientsBanner(),
            const Spacer(),
          ],
        ).appPaddingHr(),
      );
}

class _HappyPatientsBanner extends StatelessWidget {
  const _HappyPatientsBanner();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 64.w,
          height: 32.h,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: _buildProfileImage(
                  'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                ),
              ),
              Positioned(
                left: 16.w,
                child: _buildProfileImage(
                  'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                ),
              ),
              Positioned(
                left: 32.w,
                child: _buildProfileImage(
                  'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                ),
              ),
            ],
          ),
        ),
        const HSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('30.000+',
                style: AppTextStyles.montserratSmallCaption
                    .copyWith(color: Colors.white)),
            Text('Happy Patients',
                style: AppTextStyles.montserratSmallCaption
                    .copyWith(color: AppColors.grey300)),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage(String imageUrl) {
    return Container(
      width: 32.w,
      height: 32.w,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: AppCachedNetworkImage(imageUrl),
    );
  }
}
