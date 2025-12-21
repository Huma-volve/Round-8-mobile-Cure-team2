import 'package:cure_team_2/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:cure_team_2/features/chat/domain/entities/chat_entity.dart';
import 'package:cure_team_2/features/chat/domain/entities/message_entity.dart';
import 'package:cure_team_2/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ChatEntity>> getChats() async {
    return await remoteDataSource.getChats();
  }

  @override
  Future<List<MessageEntity>> getMessages(String chatId) async {
    return await remoteDataSource.getMessages(chatId);
  }

  @override
  Future<void> sendMessage(
      String chatId, String content, MessageType type) async {
    return await remoteDataSource.sendMessage(chatId, content, type);
  }

  @override
  Future<List<ChatEntity>> searchChats(String query) async {
    return await remoteDataSource.searchChats(query);
  }
}
