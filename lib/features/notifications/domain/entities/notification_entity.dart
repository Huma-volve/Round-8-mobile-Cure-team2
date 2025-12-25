import 'package:equatable/equatable.dart';

enum NotificationType { appointment, completed, cancelled }

class NotificationEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime timestamp;
  final NotificationType type;
  final bool isRead;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.type,
    this.isRead = false,
  });

  @override
  List<Object?> get props => [id, title, description, timestamp, type, isRead];
}
