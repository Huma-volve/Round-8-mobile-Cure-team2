import 'package:bloc/bloc.dart';
import 'package:cure_team_2/features/notifications/domain/repositories/notification_repository.dart';
import 'package:cure_team_2/features/notifications/presentation/cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository repository;

  NotificationCubit(this.repository) : super(NotificationInitial());

  Future<void> loadNotifications() async {
    emit(NotificationLoading());
    try {
      final notifications = await repository.getNotifications();
      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> markAsRead(String id) async {
    try {
      await repository.readNotification(id);
      // Optimistic update or reload
      loadNotifications();
    } catch (e) {
      // Handle error (maybe show snackbar via listener)
    }
  }

  Future<void> markAllAsRead() async {
    try {
      await repository.readAllNotifications();
      loadNotifications();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> deleteNotification(String id) async {
    try {
      await repository.deleteNotification(id);
      loadNotifications();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> deleteAllNotifications() async {
    try {
      await repository.deleteAllNotifications();
      loadNotifications();
    } catch (e) {
      // Handle error
    }
  }
}
