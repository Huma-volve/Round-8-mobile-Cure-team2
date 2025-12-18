import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/chat/presentation/cubit/chat_list_cubit.dart';
import 'package:cure_team_2/features/chat/presentation/widgets/chat_item_widget.dart';
import 'package:cure_team_2/features/chat/presentation/pages/chat_detail_screen.dart';

class ChatSearchScreen extends StatefulWidget {
  const ChatSearchScreen({super.key});

  @override
  State<ChatSearchScreen> createState() => _ChatSearchScreenState();
}

class _ChatSearchScreenState extends State<ChatSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text("Search", style: AppTextStyles.headerTitle),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for chat, doctor",
                hintStyle: AppTextStyles.chatSubtitle,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFF7F8FA),
              ),
              onChanged: (value) {
                context.read<ChatListCubit>().searchChats(value);
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<ChatListCubit, ChatListState>(
              builder: (context, state) {
                if (state is ChatListLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatListLoaded) {
                  return ListView.builder(
                    itemCount: state.chats.length,
                    itemBuilder: (context, index) {
                      final chat = state.chats[index];
                      return ChatItemWidget(
                        chat: chat,
                        currentUserId: 'current_user',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ChatDetailScreen(
                                      chatId: chat.id,
                                      chatName: chat.participants
                                          .firstWhere(
                                              (p) => p.id != 'current_user')
                                          .name)));
                        },
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
