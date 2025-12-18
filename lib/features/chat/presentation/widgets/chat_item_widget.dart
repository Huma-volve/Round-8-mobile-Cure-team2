import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/chat/domain/entities/chat_entity.dart';
import 'package:cure_team_2/features/chat/domain/entities/user_entity.dart';

class ChatItemWidget extends StatelessWidget {
  final ChatEntity chat;
  final VoidCallback onTap;
  final String currentUserId;

  const ChatItemWidget({
    super.key,
    required this.chat,
    required this.onTap,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final otherParticipant = chat.participants.cast<UserEntity>().firstWhere(
          (p) => p.id != currentUserId,
          orElse: () => chat.participants.first,
        );

    // Format time (simplistic for mock)
    final timeStr = chat.lastMessage != null
        ? "${chat.lastMessage!.timestamp.hour}:${chat.lastMessage!.timestamp.minute.toString().padLeft(2, '0')}"
        : "";

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: otherParticipant.avatarUrl != null
                    ? DecorationImage(
                        image: AssetImage(otherParticipant.avatarUrl!),
                        fit: BoxFit.cover)
                    : null,
              ),
              child: otherParticipant.avatarUrl == null
                  ? const Icon(Icons.person, color: Colors.grey)
                  : null,
            ),
            SizedBox(width: 12.w),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        otherParticipant.name,
                        style: AppTextStyles.chatTitle,
                      ),
                      Text(
                        timeStr,
                        style: AppTextStyles.chatTime.copyWith(
                          color: chat.unreadCount > 0
                              ? AppColors.primaryBlue
                              : AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          chat.lastMessage?.content ?? "No messages yet",
                          style: AppTextStyles.chatSubtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (chat.unreadCount > 0)
                        Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: const BoxDecoration(
                            color: AppColors.greenBadge,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            chat.unreadCount.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
