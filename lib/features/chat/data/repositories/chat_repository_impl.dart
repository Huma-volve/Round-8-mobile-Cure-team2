import 'package:cure_team_2/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:cure_team_2/features/chat/domain/entities/chat_entity.dart';
import 'package:cure_team_2/features/chat/domain/entities/message_entity.dart';
import 'package:cure_team_2/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ChatEntity>> getChats() => remoteDataSource.getChats();

  @override
  Future<List<MessageEntity>> getMessages(String chatId) =>
      remoteDataSource.getMessages(chatId);

  @override
  Future<void> sendMessage(String chatId, String content, MessageType type) =>
      remoteDataSource.sendMessage(chatId, content, type);

  @override
  Future<List<ChatEntity>> searchChats(String query) =>
      remoteDataSource.searchChats(query);

        @override
        Future<void> addToFavorites(String chatId) {
          // TODO: implement addToFavorites
          throw UnimplementedError();
        }
      
        @override
        Future<void> deleteChatMessages(String chatId) {
          // TODO: implement deleteChatMessages
          throw UnimplementedError();
        }
      
        @override
        Future<void> deleteMessage(String chatId, String messageId) {
          // TODO: implement deleteMessage
          throw UnimplementedError();
        }
      
        @override
        Future<List<ChatEntity>> getFavoriteChats() {
          // TODO: implement getFavoriteChats
          throw UnimplementedError();
        }
      
        @override
        Future<void> removeFromFavorites(String chatId) {
          // TODO: implement removeFromFavorites
          throw UnimplementedError();
        }

  // @override
  // Future<void> deleteMessage(String chatId, String messageId) =>
  //     remoteDataSource.deleteMessage(chatId, messageId);

  // @override
  // Future<void> deleteChatMessages(String chatId) =>
  //     remoteDataSource.deleteChatMessages(chatId);

  // @override
  // Future<List<ChatEntity>> getFavoriteChats() =>
  //     remoteDataSource.getFavoriteChats();

  // @override
  // Future<void> addToFavorites(String chatId) =>
  //     remoteDataSource.addToFavorites(chatId);

  // @override
  // Future<void> removeFromFavorites(String chatId) =>
  //     remoteDataSource.removeFromFavorites(chatId);
}
