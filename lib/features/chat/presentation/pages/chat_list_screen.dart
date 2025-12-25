import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/chat/presentation/cubit/chat_list_cubit.dart';
import 'package:cure_team_2/features/chat/presentation/pages/chat_detail_screen.dart';
import 'package:cure_team_2/features/chat/presentation/pages/chat_search_screen.dart';
import 'package:cure_team_2/features/chat/presentation/widgets/chat_item_widget.dart';
import 'package:cure_team_2/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:cure_team_2/features/chat/data/repositories/chat_repository_impl.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject Cubit here for simplicity, or in global provider
    // For this task, local injection is fine as it's a feature root
    return BlocProvider(
      create:
          (context) =>
              ChatListCubit(ChatRepositoryImpl(MockChatRemoteDataSourceImpl()))
                ..loadChats(),
      child: const _ChatListScreenContent(),
    );
  }
}

class _ChatListScreenContent extends StatefulWidget {
  const _ChatListScreenContent();

  @override
  State<_ChatListScreenContent> createState() => _ChatListScreenContentState();
}

class _ChatListScreenContentState extends State<_ChatListScreenContent> {
  final List<String> _tabs = ["All", "Unread", "Favorites"];
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_tabs[_selectedTab], style: AppTextStyles.headerTitle),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar Placeholder (Navigates to Search Screen)
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => BlocProvider.value(
                        value: context.read<ChatListCubit>(),
                        child: const ChatSearchScreen(),
                      ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10.w),
                  Text(
                    "Search for chat, doctor",
                    style: AppTextStyles.chatSubtitle,
                  ),
                ],
              ),
            ),
          ),

          // Tabs
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                _buildTab(_tabs[0], 0),
                SizedBox(width: 16.w),
                _buildTab(_tabs[1], 1),
                SizedBox(width: 16.w),
                _buildTab(_tabs[2], 2),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // List
          Expanded(
            child: BlocBuilder<ChatListCubit, ChatListState>(
              builder: (context, state) {
                if (state is ChatListLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatListError) {
                  return Center(child: Text(state.message));
                } else if (state is ChatListLoaded) {
                  // Filter based on tab
                  final chats = state.chats;
                  // Needs logic for Unread/Favorites filtering if we had flags
                  // For mock, let's just show all for All/Fav, and filter unread > 0 for Unread

                  final filteredChats =
                      _selectedTab == 1
                          ? chats.where((c) => c.unreadCount > 0).toList()
                          : chats; // Favorites not implemented in Entity, treating as All for now

                  return ListView.builder(
                    itemCount: filteredChats.length,
                    itemBuilder: (context, index) {
                      final chat = filteredChats[index];
                      return ChatItemWidget(
                        chat: chat,
                        currentUserId: 'current_user',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => ChatDetailScreen(
                                    chatId: chat.id,
                                    chatName:
                                        chat.participants
                                            .firstWhere(
                                              (p) => p.id != 'current_user',
                                            )
                                            .name,
                                  ),
                            ),
                          ).then((_) {
                            // Reload on return to update unread status potentially
                            if (context.mounted) {
                              context.read<ChatListCubit>().loadChats();
                            }
                          });
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

  Widget _buildTab(String text, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.secondaryText,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
