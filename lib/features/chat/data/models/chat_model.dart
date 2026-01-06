import 'package:cure_team_2/features/chat/data/models/message_model.dart';
import 'package:cure_team_2/features/chat/data/models/user_model.dart';
import 'package:cure_team_2/features/chat/domain/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  const ChatModel({
    required super.id,
    required List<UserModel> participants,
    MessageModel? lastMessage,
    super.unreadCount,
  }) : super(participants: participants, lastMessage: lastMessage);

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    final participantsJson = json['participants'] ?? json['users'];
    final lastMessageJson = json['lastMessage'] ?? json['last_message'];
    final unreadRaw = json['unreadCount'] ?? json['unread_count'];
    final unreadCount =
        unreadRaw is int ? unreadRaw : int.tryParse(unreadRaw.toString()) ?? 0;
    return ChatModel(
      id: json['id'],
      participants:
          (json['participants'] as List)
              .map((e) => UserModel.fromJson(e))
              .toList(),
      lastMessage:
          json['lastMessage'] != null
              ? MessageModel.fromJson(json['lastMessage'])
              : null,
      unreadCount: json['unreadCount'] ?? 0,
    );
  }
}
