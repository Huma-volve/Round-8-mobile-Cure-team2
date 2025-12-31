import 'package:cure_team_2/features/notifications/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> getNotifications();
  Future<List<NotificationEntity>> getUnreadNotifications();
  Future<void> readNotification(String id);
  Future<void> readAllNotifications();
  Future<void> deleteNotification(String id);
  Future<void> deleteAllNotifications();
}
