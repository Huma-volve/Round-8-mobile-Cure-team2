import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  const OnBoardingPageIndicator({
    required this.pageNotifier,
    required this.pageCount,
    this.activeColor = AppColors.primary,
    this.inactiveOpacity = 0.35,
    this.inActiveColor = AppColors.grey600,
    super.key,
  });

  final ValueNotifier<int> pageNotifier;
  final int pageCount;
  final Color activeColor;
  final Color inActiveColor;
  final double inactiveOpacity;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: pageNotifier,
      builder: (_, currentPage, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(pageCount, (index) {
            final bool isActive = index == currentPage;
            final Color indicatorColor =
                isActive ? activeColor : inActiveColor.withValues(alpha: 0.5);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 8.h,
              width: isActive ? 32.w : 8.w,
              decoration: BoxDecoration(
                color: indicatorColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
            );
          }),
        );
      },
    );
  }
}
