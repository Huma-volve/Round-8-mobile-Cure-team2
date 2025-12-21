import 'package:cure_team_2/features/notifications/data/models/notification_model.dart';
import 'package:cure_team_2/features/notifications/domain/entities/notification_entity.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
}

class MockNotificationRemoteDataSourceImpl
    implements NotificationRemoteDataSource {
  @override
  Future<List<NotificationModel>> getNotifications() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock data based on screenshots
    return [
      NotificationModel(
        id: '1',
        title: 'Upcoming Appointment',
        description:
            'Reminder: You have an appointment with Dr. Emily Walker at 10:00 AM.',
        timestamp: DateTime.now().add(const Duration(hours: 1)),
        type: NotificationType.appointment,
        isRead: false,
      ),
      NotificationModel(
        id: '2',
        title: 'Appointment completed',
        description:
            'You have successfully booked your appointment with Dr. Emily Walker.',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        type: NotificationType.completed,
        isRead: true,
      ),
      NotificationModel(
        id: '3',
        title: 'Appointment Cancelled',
        description:
            'You have successfully cancelled your appointment with Dr. David Patel.',
        timestamp: DateTime.now().subtract(const Duration(hours: 4)),
        type: NotificationType.cancelled,
        isRead: true,
      ),
    ];
  }
}
