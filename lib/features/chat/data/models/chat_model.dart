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
    return ChatModel(
      id: json['id'],
      participants: (json['participants'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList(),
      lastMessage: json['lastMessage'] != null
          ? MessageModel.fromJson(json['lastMessage'])
          : null,
      unreadCount: json['unreadCount'] ?? 0,
    );
  }

  // helper to get logic properties if needed
}
