import 'package:bloc/bloc.dart';
import 'package:cure_team_2/features/notifications/domain/entities/notification_entity.dart';
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
    final currentState = state;
    if (currentState is NotificationLoaded) {
      final updatedNotifications =
          currentState.notifications
              .map(
                (notification) =>
                    notification.id == id
                        ? _withReadState(notification, true)
                        : notification,
              )
              .toList();
      emit(NotificationLoaded(updatedNotifications));
    }
    try {
      await repository.readNotification(id);
    } catch (e) {
      if (currentState is NotificationLoaded) {
        emit(currentState);
      }
    }
  }

  Future<void> markAllAsRead() async {
    final currentState = state;
    if (currentState is NotificationLoaded) {
      final updatedNotifications =
          currentState.notifications
              .map((notification) => _withReadState(notification, true))
              .toList();
      emit(NotificationLoaded(updatedNotifications));
    }
    try {
      await repository.readAllNotifications();
    } catch (e) {
      if (currentState is NotificationLoaded) {
        emit(currentState);
      }
    }
  }

  Future<void> deleteNotification(String id) async {
    final currentState = state;
    if (currentState is NotificationLoaded) {
      final updatedNotifications =
          currentState.notifications
              .where((notification) => notification.id != id)
              .toList();
      emit(NotificationLoaded(updatedNotifications));
    }
    try {
      await repository.deleteNotification(id);
    } catch (e) {
      if (currentState is NotificationLoaded) {
        emit(currentState);
      }
    }
  }

  Future<void> deleteAllNotifications() async {
    final currentState = state;
    if (currentState is NotificationLoaded) {
      emit(const NotificationLoaded([]));
    }
    try {
      await repository.deleteAllNotifications();
    } catch (e) {
      if (currentState is NotificationLoaded) {
        emit(currentState);
      }
    }
  }

  NotificationEntity _withReadState(
    NotificationEntity notification,
    bool isRead,
  ) {
    if (notification.isRead == isRead) {
      return notification;
    }
    return NotificationEntity(
      id: notification.id,
      title: notification.title,
      description: notification.description,
      timestamp: notification.timestamp,
      type: notification.type,
      isRead: isRead,
    );
  }
}
