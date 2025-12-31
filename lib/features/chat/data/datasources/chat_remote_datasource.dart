import 'package:cure_team_2/features/chat/data/models/chat_model.dart';
import 'package:cure_team_2/features/chat/data/models/message_model.dart';
import 'package:cure_team_2/features/chat/domain/entities/message_entity.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatModel>> getChats();
  Future<List<MessageModel>> getMessages(String chatId);
  Future<void> sendMessage(String chatId, String content, MessageType type);
  Future<List<ChatModel>> searchChats(String query);

  Future<void> deleteMessage(String chatId, String messageId);
  Future<void> deleteChatMessages(String chatId);

  Future<List<ChatModel>> getFavoriteChats();
  Future<void> addToFavorites(String chatId);
  Future<void> removeFromFavorites(String chatId);
}
