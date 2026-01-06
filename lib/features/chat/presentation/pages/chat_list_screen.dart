import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/chat/presentation/cubit/chat_list_cubit.dart';
import 'package:cure_team_2/features/chat/presentation/pages/chat_detail_screen.dart';
import 'package:cure_team_2/features/chat/presentation/pages/chat_search_screen.dart';
import 'package:cure_team_2/features/chat/presentation/widgets/chat_item_widget.dart';
import 'package:get_it/get_it.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<ChatListCubit>()..loadChats(),
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
  int _selectedTab = 0;
  static const List<String> _tabLabels = ['All', 'Unread', 'Favorites'];
  void _onTabSelected(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
    final cubit = context.read<ChatListCubit>();
    if (index == 2) {
      cubit.loadFavoriteChats();
    } else {
      cubit.loadChats();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_tabLabels[_selectedTab], style: AppTextStyles.headerTitle),
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
                _buildTab(_tabLabels[0], 0),
                SizedBox(width: 16.w),
                _buildTab(_tabLabels[1], 1),
                SizedBox(width: 16.w),
                _buildTab(_tabLabels[2], 2),
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
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(state.message, textAlign: TextAlign.center),
                    ),
                  );
                } else if (state is ChatListLoaded) {
                  final chats = state.chats;
                  final filteredChats =
                      _selectedTab == 1
                          ? chats.where((c) => c.unreadCount > 0).toList()
                          : chats;

                  if (filteredChats.isEmpty) {
                    return const Center(child: Text('No chats found'));
                  }

                  return ListView.builder(
                    itemCount: filteredChats.length,
                    itemBuilder: (context, index) {
                      final chat = filteredChats[index];

                      final otherParticipant =
                          chat.participants.isNotEmpty
                              ? chat.participants.firstWhere(
                                (p) => p.id != 'current_user',
                                orElse: () => chat.participants.first,
                              )
                              : null;
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
                                        otherParticipant?.name ?? 'Unknown',
                                  ),
                            ),
                          ).then((_) {
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
        _onTabSelected(index);
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
