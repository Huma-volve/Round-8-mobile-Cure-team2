import 'package:cure_team_2/core/models/specialists_model.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/spacing.dart';

class SpecialistsTabBar extends StatelessWidget {
  final List<SpecialistsModel> tabs;

  const SpecialistsTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final controller = DefaultTabController.of(context);
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return TabBar(
          padding: EdgeInsets.zero,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          controller: controller,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
          indicator: const BoxDecoration(color: Colors.transparent),
          tabs: List.generate(
            tabs.length,
                (index) => _TabItem(
              selected: controller.index == index,
              model: tabs[index],
            ),
          ),
        );
      },
    );
  }
}

class _TabItem extends StatelessWidget {
  final bool selected;
  final SpecialistsModel model;

  const _TabItem({
    required this.selected,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (model.icon != null) ...[
            SvgPicture.asset(
              model.icon!,
              width: 24.w,
              height: 24.h,
            ),
            const HSpace(4),
          ],
          Text(
            model.name,
            style: AppTextStyles.montserratButton.copyWith(
              color: selected ? Colors.white : AppColors.grey700,
            ),
          ),
        ],
      ),
    );
  }
}
