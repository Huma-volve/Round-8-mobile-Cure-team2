import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/features/notifications/domain/entities/notification_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItemWidget extends StatelessWidget {
  final NotificationEntity notification;

  const NotificationItemWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          notification.isRead
              ? Colors.transparent
              : const Color(0xFFF2F8FF), // Highlight unread
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.text,
                      ),
                    ),
                    Text(
                      _formatTime(notification.timestamp),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  notification.description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryText,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    IconData iconData;
    Color color;
    Color bg;

    switch (notification.type) {
      case NotificationType.appointment:
        iconData = Icons.schedule;
        color = const Color(0xFF145DB8); // Blue
        bg = const Color(0xFFE8EFF8);
        break;
      case NotificationType.completed:
        iconData = Icons.check_circle_outline;
        color = const Color(0xFF43A047); // Green
        bg = const Color(0xFFEDF7EE);
        break;
      case NotificationType.cancelled:
        iconData =
            Icons
                .calendar_today_outlined; // Needs custom icon really, but this works
        color = const Color(0xFFE53935); // Red
        bg = const Color(0xFFFFEBEE);
        break;
    }

    return Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Icon(iconData, color: color, size: 24.sp),
    );
  }

  String _formatTime(DateTime timestamp) {
    final difference = DateTime.now().difference(timestamp);
    if (difference.inHours > 0) {
      return "${difference.inHours}h";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes}m";
    } else {
      return "Now";
    }
  }
}
