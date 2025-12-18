import 'dart:async';
import 'package:cure_team_2/features/chat/data/models/chat_model.dart';
import 'package:cure_team_2/features/chat/data/models/message_model.dart';
import 'package:cure_team_2/features/chat/data/models/user_model.dart';
import 'package:cure_team_2/features/chat/domain/entities/message_entity.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatModel>> getChats();
  Future<List<MessageModel>> getMessages(String chatId);
  Future<void> sendMessage(String chatId, String content, MessageType type);
  Future<List<ChatModel>> searchChats(String query);
}

class MockChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  // Mock Data
  final UserModel _currentUser = const UserModel(
    id: 'current_user',
    name: 'Seif',
  );

  final UserModel _drRobert = const UserModel(
    id: 'dr_robert',
    name: 'Dr. Robert Lewis',
    avatarUrl: 'assets/images/dr_robert.png', // Placeholder
  );

  final UserModel _drJessica = const UserModel(
    id: 'dr_jessica',
    name: 'Dr. Jessica Turner',
    avatarUrl: 'assets/images/dr_jessica.png', // Placeholder
  );

  final UserModel _drJana = const UserModel(
    id: 'dr_jana',
    name: 'Dr. Jana',
    avatarUrl: 'assets/images/dr_jana.png', // Placeholder
  );

  // In-memory storage
  final List<MessageModel> _messages = [];
  List<ChatModel> _chats = [];

  MockChatRemoteDataSourceImpl() {
    _initializeMockData();
  }

  void _initializeMockData() {
    // Dr. Robert Messages
    final now = DateTime.now();
    _messages.addAll([
      MessageModel(
        id: '1',
        senderId: _drRobert.id,
        content: 'Hi seif it\'s been a while',
        type: MessageType.text,
        timestamp: now.subtract(const Duration(minutes: 60)),
      ),
      MessageModel(
        id: '2',
        senderId: _currentUser.id,
        content: 'Hi doctor that right',
        type: MessageType.text,
        timestamp: now.subtract(const Duration(minutes: 55)),
      ),
      MessageModel(
        id: '3',
        senderId: _currentUser.id,
        content: 'i was okey, but now i suffer form issues',
        type: MessageType.text,
        timestamp: now.subtract(const Duration(minutes: 50)),
      ),
      MessageModel(
        id: '4',
        senderId: _currentUser.id,
        content: 'I feel bad',
        type: MessageType.text,
        timestamp: now.subtract(const Duration(minutes: 45)),
      ),
      MessageModel(
        id: '5',
        senderId: _currentUser.id,
        content: 'What about you visit me',
        type: MessageType.text,
        timestamp: now.subtract(const Duration(minutes: 40)),
      ),
      MessageModel(
        id: '6',
        senderId: _currentUser.id,
        content: 'i free tomorrow, It\'s been around six PM',
        type: MessageType.text,
        timestamp: now.subtract(const Duration(minutes: 1)),
      ),
    ]);

    // Initial Chats
    _chats = [
      ChatModel(
        id: 'chat_1',
        participants: [_currentUser, _drRobert],
        lastMessage: _messages.last,
        unreadCount: 3,
      ),
      ChatModel(
        id: 'chat_2',
        participants: [_currentUser, _drJana],
        lastMessage: MessageModel(
          id: '10',
          senderId: _currentUser.id,
          content: 'you: ok i will do it like...',
          type: MessageType.text,
          timestamp: now.subtract(const Duration(hours: 4)),
        ),
        unreadCount: 0,
      ),
      ChatModel(
        id: 'chat_3',
        participants: [_currentUser, _drJessica],
        lastMessage: MessageModel(
          id: '11',
          senderId: _drJessica.id,
          content: 'It\'s been around six.....',
          type: MessageType.text,
          timestamp: now.subtract(const Duration(days: 1)),
        ),
        unreadCount: 0,
      ),
      ChatModel(
        id: 'chat_4',
        participants: [
          _currentUser,
          const UserModel(id: 'dr_jessica_2', name: 'Dr. Jessica')
        ],
        lastMessage: MessageModel(
          id: '12',
          senderId: 'dr_jessica_2',
          content: 'It\'s been around six.....',
          type: MessageType.text,
          timestamp: now.subtract(const Duration(days: 2)),
        ),
        unreadCount: 0,
      ),
    ];
  }

  @override
  Future<List<ChatModel>> getChats() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate latency
    return _chats;
  }

  @override
  Future<List<MessageModel>> getMessages(String chatId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Implementation note: simplistic filtering for mock purposes.
    // In real app, we filter by chatId. Here we assume all messages belong to chat_1 for simplicity
    // unless strictly separated.
    // For this mock, let's just return _messages for chat_1 and empty for others to avoid complexity,
    // or better, filter if we add chatId to MessageModel (which we haven't, but we can assume).

    if (chatId == 'chat_1') return _messages;
    return [];
  }

  @override
  Future<void> sendMessage(
      String chatId, String content, MessageType type) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newMessage = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: _currentUser.id,
      content: content,
      type: type,
      timestamp: DateTime.now(),
    );

    // In a real mock we'd update the list
    if (chatId == 'chat_1') {
      _messages.add(newMessage);

      // Update last message of the chat
      final index = _chats.indexWhere((c) => c.id == chatId);
      if (index != -1) {
        final chat = _chats[index];
        _chats[index] = ChatModel(
          id: chat.id,
          participants: chat.participants
              .cast<UserModel>()
              .toList(), // Cast needed if strict
          lastMessage: newMessage,
          unreadCount: chat.unreadCount,
        );
      }
    }
  }

  @override
  Future<List<ChatModel>> searchChats(String query) async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (query.isEmpty) return _chats;
    return _chats.where((chat) {
      final name =
          chat.participants.firstWhere((p) => p.id != _currentUser.id).name;
      return name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
