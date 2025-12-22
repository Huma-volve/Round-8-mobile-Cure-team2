import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';

import 'package:cure_team_2/features/chat/presentation/cubit/chat_detail_cubit.dart';
import 'package:cure_team_2/features/chat/presentation/widgets/message_bubble_widget.dart';
import 'package:cure_team_2/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:cure_team_2/features/chat/data/repositories/chat_repository_impl.dart';

class ChatDetailScreen extends StatelessWidget {
  final String chatId;
  final String chatName;

  const ChatDetailScreen({
    super.key,
    required this.chatId,
    required this.chatName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatDetailCubit(ChatRepositoryImpl(MockChatRemoteDataSourceImpl()))
            ..loadMessages(chatId),
      child: _ChatDetailScreenContent(chatName: chatName, chatId: chatId),
    );
  }
}

class _ChatDetailScreenContent extends StatefulWidget {
  final String chatName;
  final String chatId;

  const _ChatDetailScreenContent(
      {required this.chatName, required this.chatId});

  @override
  State<_ChatDetailScreenContent> createState() =>
      _ChatDetailScreenContentState();
}

class _ChatDetailScreenContentState extends State<_ChatDetailScreenContent> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;
    context.read<ChatDetailCubit>().sendMessage(widget.chatId, text);
    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: const Icon(Icons.person, color: Colors.grey),
            ),
            SizedBox(width: 10.w),
            Text(widget.chatName,
                style: TextStyle(color: Colors.black, fontSize: 16.sp)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.videocam_outlined, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call_outlined, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.black)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatDetailCubit, ChatDetailState>(
              listener: (context, state) {
                if (state is ChatDetailLoaded) {
                  // Wait for layout to build then scroll
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => _scrollToBottom());
                }
              },
              builder: (context, state) {
                if (state is ChatDetailLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatDetailLoaded) {
                  return ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      // Determine if me
                      final isMe = message.senderId == 'current_user';
                      return MessageBubbleWidget(message: message, isMe: isMe);
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),

          // Input Area
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2)),
            ]),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Message",
                        border: InputBorder.none,
                        suffixIcon: SizedBox(
                          width: 72,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.attach_file, color: Colors.grey),
                              SizedBox(width: 8),
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _messageController,
                  builder: (context, value, _) {
                    final hasText = value.text.trim().isNotEmpty;
                    return GestureDetector(
                      onTap: _sendMessage,
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryBlue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          hasText ? Icons.send : Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
