import 'package:cure_team_2/features/notifications/domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required super.id,
    required super.title,
    required super.description,
    required super.timestamp,
    required super.type,
    super.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'].toString(),
      title: json['title'] ?? 'Notification',
      description:
          json['description'] ?? json['body'] ?? json['data']?['message'] ?? '',
      timestamp:
          DateTime.tryParse(json['timestamp'] ?? json['created_at'] ?? '') ??
          DateTime.now(),
      type: NotificationType.values.firstWhere(
        (e) => e.name == (json['type'] ?? ''),
        orElse: () => NotificationType.appointment,
      ),
      isRead: json['isRead'] ?? (json['read_at'] != null),
    );
  }
}
