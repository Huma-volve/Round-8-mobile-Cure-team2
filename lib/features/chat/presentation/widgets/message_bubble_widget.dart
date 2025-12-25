import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/chat/domain/entities/message_entity.dart';

class MessageBubbleWidget extends StatelessWidget {
  final MessageEntity message;
  final bool isMe;

  const MessageBubbleWidget({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color:
              isMe ? AppColors.myMessageBubble : AppColors.otherMessageBubble,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomLeft: isMe ? Radius.circular(12.r) : Radius.zero,
            bottomRight: isMe ? Radius.zero : Radius.circular(12.r),
          ),
        ),
        constraints: BoxConstraints(maxWidth: 0.7.sw),
        child: Text(
          message.content,
          style: AppTextStyles.chatSubtitle.copyWith(
            color: isMe ? Colors.white : AppColors.text,
          ),
        ),
      ),
    );
  }
}
