import 'package:cure_team_2/features/chat/domain/entities/chat_entity.dart';
import 'package:cure_team_2/features/chat/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Future<List<ChatEntity>> getChats();
  Future<List<MessageEntity>> getMessages(String chatId);
  Future<void> sendMessage(String chatId, String content, MessageType type);
  Future<List<ChatEntity>> searchChats(String query);
}
