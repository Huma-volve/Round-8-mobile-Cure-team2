import 'package:cure_team_2/core/network/api_client.dart';
import 'package:cure_team_2/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:cure_team_2/features/chat/data/models/chat_model.dart';
import 'package:cure_team_2/features/chat/data/models/message_model.dart';
import 'package:cure_team_2/features/chat/domain/entities/message_entity.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final ApiClient apiClient;

  ChatRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<ChatModel>> getChats() async {
    final response = await apiClient.get('user/chats');
    if (response.statusCode == 200) {
      final data = response.data;
      if (data['data'] != null && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => ChatModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MessageModel>> getMessages(String chatId) async {
    final response = await apiClient.get(
      'user/chats/$chatId/messages',
      queryParameters: {'page': 1, 'per_page': 100},
    );
    if (response.statusCode == 200) {
      final data = response.data;
      if (data['data'] != null && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => MessageModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> sendMessage(
    String chatId,
    String content,
    MessageType type,
  ) async {
    final response = await apiClient.post(
      'user/chat/message',
      data: {'chat_id': chatId, 'message': content, 'type': type.name},
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ServerException();
    }
  }

  @override
  Future<List<ChatModel>> searchChats(String query) async {
    final response = await apiClient.get(
      'user/search',
      queryParameters: {'keyword': query},
    );
    if (response.statusCode == 200) {
      final data = response.data;
      if (data['data'] != null && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => ChatModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteMessage(String chatId, String messageId) async {
    final response = await apiClient.delete(
      'user/chat/$chatId/message/$messageId',
    );
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteChatMessages(String chatId) async {
    final response = await apiClient.delete('user/chat/$chatId/messages');
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<List<ChatModel>> getFavoriteChats() async {
    final response = await apiClient.get('user/favorites/chats');
    if (response.statusCode == 200) {
      final data = response.data;
      if (data['data'] != null && data['data']['rooms'] is List) {
        return (data['data']['rooms'] as List)
            .map((e) => ChatModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addToFavorites(String chatId) async {
    final response = await apiClient.get('user/favorites/add/$chatId');
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> removeFromFavorites(String chatId) async {
    final response = await apiClient.delete('user/favorites/remove/$chatId');
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }
}

class ServerException implements Exception {}
