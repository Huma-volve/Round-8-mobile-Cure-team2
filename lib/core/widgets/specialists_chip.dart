import 'package:cure_team_2/core/models/specialists_model.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum SpecialistChipDirection { horizontal, vertical }

class SpecialistsChip extends StatelessWidget {
  final SpecialistChipDirection direction;
  final SpecialistsModel model ;

  const SpecialistsChip({
    super.key,
    required this.model,
    this.direction = SpecialistChipDirection.horizontal,
  });

  factory SpecialistsChip.vertical({required SpecialistsModel model}) =>
       SpecialistsChip(direction: SpecialistChipDirection.vertical , model: model,);

  @override
  Widget build(BuildContext context) {
    final icon = model.icon ;
    final label = model.name ;
    final isVertical = direction == SpecialistChipDirection.vertical;
    final color = isVertical ? AppColors.grey900 : AppColors.grey700;

    final child = isVertical
        ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(icon !=null)...[
          SvgPicture.network(icon!,width: 24.w,height: 24.h, ),
          const VSpace(2),
        ],

        Text(label, style: AppTextStyles.montserratButton.copyWith(color: color)),
      ],
    )
        : Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if(icon !=null)...[
          SvgPicture.network(icon,width: 24.w,height: 24.h, ),
          const VSpace(2),
        ],
        Text(label, style: AppTextStyles.montserratButton.copyWith(color: color)),
      ],
    );

    return Container(
      height: isVertical ? 68.h : 40.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: isVertical ? AppColors.grey50 : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey300),
      ),
      child: child,
    );
  }
}
