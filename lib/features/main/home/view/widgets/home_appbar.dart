import 'package:cure_team_2/core/extensions/style.dart';
import 'package:cure_team_2/core/widgets/app_cached_network_image.dart';
import 'package:cure_team_2/core/widgets/app_click.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/spacing.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: const AppCachedNetworkImage(
              "https://t4.ftcdn.net/jpg/04/31/64/75/360_F_431647519_usrbQ8Z983hTYe8zgA7t1XVc5fEtqcpa.jpg"),
        ),
        const HSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back, Seif",
              style: AppTextStyles.georgiaCaption,
            ),
            const VSpace(4),
            Row(
              children: [
                Icon(
                  Icons.pin_drop,
                  size: 16.sp,
                  color: AppColors.grey,
                ),
                Text(
                  "129,El-Nasr Street, Cairo",
                  style: AppTextStyles.montserratSmallCaption
                      .copyWith(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        actionContainer(icon: Icons.favorite_border),
        actionContainer(icon: Icons.notifications_none_outlined),
      ],
    );
  }

  Widget actionContainer({required IconData icon, VoidCallback? onTap}) {
    return AppClick(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.all(2.w),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: AppColors.grey.withAppOpacity(0.3),
              blurRadius: 1,
              offset: const Offset(1, 2))
        ], color: Colors.white, borderRadius: BorderRadius.circular(11.r)),
        child: Icon(
          icon,
          size: 24.sp,
        ),
      ),
    );
  }
}
