import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTile extends StatelessWidget {
  final Widget leading;
  final String? title;
  final Widget? titleWidget;
  final Widget? trailing;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final bool showArrow;

  const ProfileTile({
    super.key,
    required this.leading,
    this.title,
    this.titleWidget,
    this.trailing,
    this.onTap,
    this.textStyle,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    final tile = Container(
      height: 48.h,
      margin: EdgeInsets.only(bottom: 12.h),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8).r,
      decoration: BoxDecoration(
        color: const Color(0xFFf5f6f7),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          leading,
          12.horizontalSpace,
          Expanded(
            child: titleWidget ??
                Text(
                  title ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: textStyle ?? AppTextStyles.montserratButton,
                ),
          ),
          if (trailing != null)
            trailing!
          else if (showArrow)
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF99a2ab),
            ),
        ],
      ),
    );

    if (onTap == null) return tile;

    return GestureDetector(
      onTap: onTap,
      child: tile,
    );
  }
}
