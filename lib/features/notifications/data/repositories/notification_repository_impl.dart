import 'package:cure_team_2/features/notifications/data/datasources/notification_remote_datasource.dart';
import 'package:cure_team_2/features/notifications/domain/entities/notification_entity.dart';
import 'package:cure_team_2/features/notifications/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<NotificationEntity>> getNotifications() =>
      remoteDataSource.getNotifications();

  @override
  Future<List<NotificationEntity>> getUnreadNotifications() =>
      remoteDataSource.getUnreadNotifications();

  @override
  Future<void> readNotification(String id) =>
      remoteDataSource.readNotification(id);

  @override
  Future<void> readAllNotifications() =>
      remoteDataSource.readAllNotifications();

  @override
  Future<void> deleteNotification(String id) =>
      remoteDataSource.deleteNotification(id);

  @override
  Future<void> deleteAllNotifications() =>
      remoteDataSource.deleteAllNotifications();
}
