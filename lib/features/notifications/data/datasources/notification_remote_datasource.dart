import 'package:cure_team_2/core/network/api_client.dart';
import 'package:cure_team_2/features/notifications/data/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
  Future<List<NotificationModel>> getUnreadNotifications();
  Future<void> readNotification(String id);
  Future<void> readAllNotifications();
  Future<void> deleteNotification(String id);
  Future<void> deleteAllNotifications();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiClient apiClient;

  NotificationRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final response = await apiClient.get('notifications');
    final data = response.data['data'];
    if (data is List) {
      return data.map((json) => NotificationModel.fromJson(json)).toList();
    }
    return [];
  }

  @override
  Future<List<NotificationModel>> getUnreadNotifications() async {
    // Assuming endpoint exists based on "GET un readed" folder in Postman
    final response = await apiClient.get('notifications/unread');
    final data = response.data['data'];
    if (data is List) {
      return data.map((json) => NotificationModel.fromJson(json)).toList();
    }
    return [];
  }

  @override
  Future<void> readNotification(String id) async {
    await apiClient.post('notifications/$id/read');
  }

  @override
  Future<void> readAllNotifications() async {
    await apiClient.post('notifications/mark-all-read');
  }

  @override
  Future<void> deleteNotification(String id) async {
    await apiClient.delete('notifications/$id');
  }

  @override
  Future<void> deleteAllNotifications() async {
    await apiClient.delete('notifications');
  }
}
