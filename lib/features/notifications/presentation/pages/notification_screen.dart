import 'package:cure_team_2/core/network/api_client.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/features/notifications/data/datasources/notification_remote_datasource.dart';
import 'package:cure_team_2/features/notifications/data/repositories/notification_repository_impl.dart';
import 'package:cure_team_2/features/notifications/presentation/cubit/notification_cubit.dart';
import 'package:cure_team_2/features/notifications/presentation/cubit/notification_state.dart';
import 'package:cure_team_2/features/notifications/presentation/widgets/empty_notification_widget.dart';
import 'package:cure_team_2/features/notifications/presentation/widgets/notification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => NotificationCubit(
            NotificationRepositoryImpl(
              NotificationRemoteDataSourceImpl(ApiClient()),
            ),
          )..loadNotifications(),
      child: const _NotificationScreenContent(),
    );
  }
}

class _NotificationScreenContent extends StatelessWidget {
  const _NotificationScreenContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.text),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.text,
            fontFamily: 'Montserrat',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: AppColors.primaryBlue),
            tooltip: "Mark all as read",
            onPressed: () {
              context.read<NotificationCubit>().markAllAsRead();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_sweep, color: Colors.red),
            tooltip: "Delete all",
            onPressed: () {
              // Show confirmation dialog ideally, but direct for now
              context.read<NotificationCubit>().deleteAllNotifications();
            },
          ),
        ],
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NotificationLoaded) {
            if (state.notifications.isEmpty) {
              return const EmptyNotificationWidget();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: state.notifications.length,
                    separatorBuilder:
                        (context, index) =>
                            Divider(height: 1, color: Colors.grey[200]),
                    itemBuilder: (context, index) {
                      final notification = state.notifications[index];
                      return Dismissible(
                        key: Key(notification.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20.w),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          context.read<NotificationCubit>().deleteNotification(
                            notification.id,
                          );
                        },
                        child: InkWell(
                          onTap: () {
                            if (!notification.isRead) {
                              context.read<NotificationCubit>().markAsRead(
                                notification.id,
                              );
                            }
                          },
                          child: NotificationItemWidget(
                            notification: notification,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is NotificationError) {
            // Show empty state on error or retry button
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Something went wrong: ${state.message}"),
                  ElevatedButton(
                    onPressed: () {
                      context.read<NotificationCubit>().loadNotifications();
                    },
                    child: Text("Retry"),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
