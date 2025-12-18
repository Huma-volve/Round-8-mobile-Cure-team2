import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/features/notifications/data/datasources/notification_remote_datasource.dart';
import 'package:cure_team_2/features/notifications/data/repositories/notification_repository_impl.dart';
import 'package:cure_team_2/features/notifications/domain/usecases/get_notifications_usecase.dart';
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
            GetNotificationsUseCase(
              NotificationRepositoryImpl(
                MockNotificationRemoteDataSourceImpl(),
              ),
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
            fontFamily: 'Montserrat', // Adjust if known
          ),
        ),
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  child: Text(
                    "Today", // Mocked section header
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: state.notifications.length,
                    separatorBuilder:
                        (context, index) =>
                            Divider(height: 1, color: Colors.grey[200]),
                    itemBuilder: (context, index) {
                      return NotificationItemWidget(
                        notification: state.notifications[index],
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is NotificationError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
