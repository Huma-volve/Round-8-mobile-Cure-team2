import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_click.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final TextStyle? style;
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final bool enabled;
  final Color borderColor;
  final Widget? icon;

  const AppButton({
    super.key,
    required this.text,
    this.style,
    this.onPressed,
    this.enabled = true,
    this.borderColor = Colors.transparent,
    this.padding,
    this.icon,
    this.color = AppColors.primary,
    this.height = 48,
    this.width = double.infinity,
    this.borderRadius = 7,
  });

  factory AppButton.icon({
    required String text,
    TextStyle? style,
    Color? color,
    double? width,
    Color? borderColor,
    double? height,
    double? borderRadius,
    required VoidCallback? onPressed,
    required Widget icon,
  }) =>
      AppButton(
        text: text,
        onPressed: onPressed,
        style: style,
        borderColor: borderColor ?? Colors.transparent,
        borderRadius: borderRadius ?? 7,
        width: width ?? double.infinity,
        height: height ?? 48,
        color: color ?? AppColors.primary,
        icon: icon,
      );

  @override
  Widget build(BuildContext context) {
    return AppClick(
      onTap: enabled ? onPressed : null,
      child: Container(
        height: height.h,
        width: width.w,
        alignment: Alignment.center,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 6.h, vertical: 3.h),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!.appPaddingHr(8),
            Text(text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: style ??
                    AppTextStyles.montserratButton
                        .copyWith(color: Colors.white)),
          ],
        ),

      ),

    );
  }
}
