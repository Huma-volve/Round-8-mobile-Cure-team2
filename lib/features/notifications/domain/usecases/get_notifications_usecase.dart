import 'package:cure_team_2/features/notifications/domain/entities/notification_entity.dart';
import 'package:cure_team_2/features/notifications/domain/repositories/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository repository;

  GetNotificationsUseCase(this.repository);

  Future<List<NotificationEntity>> call() async {
    return await repository.getNotifications();
  }
}
